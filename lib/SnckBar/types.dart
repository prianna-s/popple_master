import 'package:popple/SnckBar/animated_snack_bar.dart';




class MobilePositionSettings {
  final double topOnAppearance;
  final double topOnDissapear;
  final double left;
  final double right;
  final double bottomOnAppearance;
  final double bottomOnDissapear;

  const MobilePositionSettings({
    this.topOnAppearance = 70,
    this.topOnDissapear = -100,
    this.left = 35,
    this.right = 35,
    this.bottomOnAppearance = 70,
    this.bottomOnDissapear = -100,
  });
}


/// Snack bar types for [AnimatedSnackBar]

/// There will be a pre defined color and icon for each one of
/// these.
enum AnimatedSnackBarType {
  info,
  error,
  success,
  warning,
}

/// Snack bar position on desktop and web devices (screens with width > 600)
enum DesktopSnackBarPosition {
  topCenter,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  bottomCenter,
}

/// Snack bar position on mobile devices (screens with width <= 600)
enum MobileSnackBarPosition { top, bottom }

/// A class to implement behaviour when having multiple snack bars
/// at once,
/// See
///   [ColumnSnackBarStrategy]
///   [RemoveSnackBarStrategy]
///   [StackSnackBarStrategy]
/// for implementation
abstract class MultipleSnackBarStrategy {
  double computeDy(List<AnimatedSnackBar> snackBars, AnimatedSnackBar self);
  List<AnimatedSnackBar> onAdd(
      List<AnimatedSnackBar> snackBars, AnimatedSnackBar self);
}

/// This class will allow you to show multiple snack bars
/// in a column format with a pre-defined gap between them.
class ColumnSnackBarStrategy implements MultipleSnackBarStrategy {
  /// Space between snackbars in the column
  final double gap;

  const ColumnSnackBarStrategy({
    this.gap = 8,
  });

  @override
  double computeDy(List<AnimatedSnackBar> snackBars, AnimatedSnackBar self) {

    return 0;
  }

  @override
  List<AnimatedSnackBar> onAdd(
      List<AnimatedSnackBar> snackBars, AnimatedSnackBar self) {
    return snackBars;
  }
}

/// This class will help you when you want
/// to remove past snackbars when a new one comes in

class RemoveSnackBarStrategy implements MultipleSnackBarStrategy {
  @override
  double computeDy(List<AnimatedSnackBar> snackBars, AnimatedSnackBar self) {
    return 0;
  }

  @override
  List<AnimatedSnackBar> onAdd(
      List<AnimatedSnackBar> snackBars, AnimatedSnackBar self) {


    return snackBars;
  }
}

/// This class will just stack the snackbars to each other
class StackSnackBarStrategy implements MultipleSnackBarStrategy {
  @override
  double computeDy(List<AnimatedSnackBar> snackBars, AnimatedSnackBar self) {
    return 0;
  }

  @override
  List<AnimatedSnackBar> onAdd(
      List<AnimatedSnackBar> snackBars, AnimatedSnackBar self) {
    return snackBars;
  }
}