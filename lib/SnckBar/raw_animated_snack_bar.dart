
import 'package:flutter/material.dart';
import 'package:popple/SnckBar/types.dart';

Duration _opacityDuration = const Duration(milliseconds: 400);

class RawAnimatedSnackBar extends StatefulWidget {
  const RawAnimatedSnackBar({
    Key? key,
    required this.duration,
    required this.child,
    required this.onRemoved,
    required this.mobileSnackBarPosition,
    required this.desktopSnackBarPosition,
    required this.getInitialDy,
    required this.mobilePositionSettings,
    required this.animationDuration,
    required this.animationCurve,
  }) : super(key: key);

  final Duration duration;
  final Widget child;
  final VoidCallback onRemoved;
  final MobileSnackBarPosition mobileSnackBarPosition;
  final DesktopSnackBarPosition desktopSnackBarPosition;
  final double Function() getInitialDy;
  final MobilePositionSettings mobilePositionSettings;
  final Duration animationDuration;
  final Curve animationCurve;

  @override
  State<RawAnimatedSnackBar> createState() => RawAnimatedSnackBarState();
}

class RawAnimatedSnackBarState extends State<RawAnimatedSnackBar> {
  bool isVisible = false;
  bool removed = false;

  double opacity = 1;

  final GlobalKey positionedKey = GlobalKey();

  void remove() {
    if (mounted && removed == false) {
      widget.onRemoved();
      removed = true;
    }
  }

  Future<void> fadeOut() {
    opacity = 0;
    setState(() {});
    return Future.delayed(_opacityDuration);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() => isVisible = true);
    });
    final fadeOutDuration = Duration(
        milliseconds:
        (widget.duration.inMilliseconds / 4).clamp(100, 2000).toInt());
    Future.delayed(
      widget.duration - fadeOutDuration,
          () {
        if (mounted) {
          setState(() => isVisible = false);
          Future.delayed(fadeOutDuration, () {
            remove();
          });
        }
      },
    );

    super.initState();
  }

  bool get isDesktop {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width > 600;
  }

  double? get top {
    if (isDesktop) {
      switch (widget.desktopSnackBarPosition) {
        case DesktopSnackBarPosition.topCenter:
        case DesktopSnackBarPosition.topLeft:
        case DesktopSnackBarPosition.topRight:
          if (isVisible) {
            return 70 + widget.getInitialDy();
          } else {
            return -100;
          }

        case DesktopSnackBarPosition.bottomRight:
        case DesktopSnackBarPosition.bottomLeft:
        case DesktopSnackBarPosition.bottomCenter:
          return null;

        default:
          throw UnimplementedError();
      }
    } else {
      if (widget.mobileSnackBarPosition == MobileSnackBarPosition.top) {
        if (isVisible) {
          return widget.mobilePositionSettings.topOnAppearance +
              widget.getInitialDy();
        } else {
          return widget.mobilePositionSettings.topOnDissapear;
        }
      } else if (widget.mobileSnackBarPosition ==
          MobileSnackBarPosition.bottom) {
        return null;
      }
    }
    throw UnimplementedError();
  }

  double? get bottom {
    if (isDesktop) {
      switch (widget.desktopSnackBarPosition) {
        case DesktopSnackBarPosition.topCenter:
        case DesktopSnackBarPosition.topLeft:
        case DesktopSnackBarPosition.topRight:
          return null;

        case DesktopSnackBarPosition.bottomRight:
        case DesktopSnackBarPosition.bottomLeft:
        case DesktopSnackBarPosition.bottomCenter:
          if (isVisible) {
            return 70 + widget.getInitialDy();
          } else {
            return -100;
          }

        default:
          throw UnimplementedError();
      }
    } else {
      if (widget.mobileSnackBarPosition == MobileSnackBarPosition.top) {
        return null;
      } else if (widget.mobileSnackBarPosition ==
          MobileSnackBarPosition.bottom) {
        if (isVisible) {
          return (widget.mobilePositionSettings.bottomOnAppearance) +
              widget.getInitialDy() +
              MediaQuery.viewInsetsOf(context).bottom;
        } else {
          return widget.mobilePositionSettings.bottomOnDissapear;
        }
      }
    }
    throw UnimplementedError();
  }

  double? get left {
    if (isDesktop) {
      switch (widget.desktopSnackBarPosition) {
        case DesktopSnackBarPosition.bottomLeft:
        case DesktopSnackBarPosition.topLeft:
          return 35;

        case DesktopSnackBarPosition.bottomCenter:
        case DesktopSnackBarPosition.topCenter:
          return (MediaQuery.of(context).size.width - width!) / 2;

        case DesktopSnackBarPosition.bottomRight:
        case DesktopSnackBarPosition.topRight:
          return MediaQuery.of(context).size.width - width! - 35;

        default:
          throw UnimplementedError();
      }
    }
    return widget.mobilePositionSettings.left;
  }

  double? get right {
    if (isDesktop) {
      switch (widget.desktopSnackBarPosition) {
        case DesktopSnackBarPosition.bottomLeft:
        case DesktopSnackBarPosition.topLeft:
          return MediaQuery.of(context).size.width - width! - 35;

        case DesktopSnackBarPosition.topCenter:
        case DesktopSnackBarPosition.bottomCenter:
          return (MediaQuery.of(context).size.width - width!) / 2;

        case DesktopSnackBarPosition.bottomRight:
        case DesktopSnackBarPosition.topRight:
          return 35;

        default:
          throw UnimplementedError();
      }
    }
    return widget.mobilePositionSettings.right;
  }

  double? get width {
    if (isDesktop) {
      final width = MediaQuery.of(context).size.width;

      return (width * .4).clamp(180, 350);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      key: positionedKey,
      duration: widget.animationDuration,
      curve: widget.animationCurve,
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: AnimatedOpacity(
        duration: _opacityDuration,
        opacity: opacity,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}