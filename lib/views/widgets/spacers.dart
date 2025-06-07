import 'package:flutter/cupertino.dart';

abstract class Spacers {

  static const double xsmallSize = 2.0;
  static const double smallSize = 4.0;
  static const double regularSize = 8.0;
  static const double mediumSize = 12.0;
  static const double largeSize = 24.0;
  static const double xlargeSize = 32.0;

  static const SizedBox xsmall = SizedBox(
    height: xsmallSize,
    width: xsmallSize,
  );
  static const SizedBox small = SizedBox(
    height: smallSize,
    width: smallSize,
  );
  static const SizedBox regular = SizedBox(
    height: regularSize,
    width: regularSize,
  );
  static const SizedBox medium = SizedBox(
    height: mediumSize,
    width: mediumSize,
  );
  static const SizedBox large = SizedBox(
    height: largeSize,
    width: largeSize,
  );
  static const SizedBox xlarge = SizedBox(
    height: xlargeSize,
    width: xlargeSize,
  );
}
