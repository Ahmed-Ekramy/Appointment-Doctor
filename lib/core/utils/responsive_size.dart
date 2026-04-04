import 'package:flutter/material.dart';

/// Call [ResponsiveSize.init(context)] once inside your root widget's build method.
/// Then use the extension getters anywhere:
///   200.w   → scaled width
///   50.h    → scaled height
///   16.sp   → scaled font size
///   12.r    → scaled radius / padding / margin
class ResponsiveSize {
  ResponsiveSize._();

  // Design reference (Figma / XD base size)
  static const double _designWidth  = 375.0;
  static const double _designHeight = 812.0;

  static double _scaleX = 1.0;
  static double _scaleY = 1.0;
  static double _scale  = 1.0;

  /// Call this once in your root widget (e.g. MaterialApp builder or first Scaffold).
  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    // Get current device dimensions
    final width  = size.width;
    final height = size.height;

    _scaleX = width  / _designWidth;
    _scaleY = height / _designHeight;
    // Use the smaller of the two scales for fonts and radius to prevent overflow
    _scale  = _scaleX < _scaleY ? _scaleX : _scaleY;
  }

  /// Scale a horizontal value (width, horizontal padding…)
  static double w(double value) => value * _scaleX;

  /// Scale a vertical value (height, vertical padding…)
  static double h(double value) => value * _scaleY;

  /// Scale a font size or border radius
  static double sp(double value) => value * _scale;

  /// Alias for [sp] — useful for radius, icon size, etc.
  static double r(double value) => value * _scale;
}

// ─── Convenient num extensions ────────────────────────────────────────────────

extension ResponsiveSizeExtension on num {
  /// Scaled width
  double get w  => ResponsiveSize.w(toDouble());

  /// Scaled height
  double get h  => ResponsiveSize.h(toDouble());

  /// Scaled font size
  double get sp => ResponsiveSize.sp(toDouble());

  /// Scaled radius / padding / margin
  double get r  => ResponsiveSize.r(toDouble());
}