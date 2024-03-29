import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sizes {
  Sizes._();

  static const p4 = 4.0;
  static const p8 = 8.0;
  static const p12 = 12.0;
  static const p16 = 16.0;
  static const p20 = 20.0;
  static const p24 = 24.0;
  static const p28 = 28.0;
  static const p32 = 32.0;
  static const p36 = 36.0;
  static const p40 = 40.0;
  static const p44 = 44.0;
  static const p48 = 48.0;
  static const p56 = 56.0;
  static const p60 = 60.0;
  static const p64 = 64.0;
  static const p72 = 72.0;
  static const p80 = 80.0;
  static const p92 = 92.0;
  static const p96 = 96.0;
  static const p100 = 100.0;
}

class Gap {
  Gap._();
  // width
  static final w8 = SizedBox(width: Sizes.p8.w);
  static final w12 = SizedBox(width: Sizes.p12.w);
  static final w16 = SizedBox(width: Sizes.p16.w);
  static final w20 = SizedBox(width: Sizes.p20.w);
  static final w24 = SizedBox(width: Sizes.p24.w);
  static final w60 = SizedBox(width: Sizes.p60.w);

  // height
  static final h8 = SizedBox(height: Sizes.p8.h);
  static final h12 = SizedBox(height: Sizes.p12.h);
  static final h16 = SizedBox(height: Sizes.p16.h);
  static final h20 = SizedBox(height: Sizes.p20.h);
  static final h24 = SizedBox(height: Sizes.p24.h);
  static final h28 = SizedBox(height: Sizes.p28.h);
  static final h60 = SizedBox(height: Sizes.p60.h);
}
