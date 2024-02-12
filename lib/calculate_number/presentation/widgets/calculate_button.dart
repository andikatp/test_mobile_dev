import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_mobile_dev/core/theme/color.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    required this.label,
    required this.function,
    super.key,
  });

  final String label;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colours.primaryColor,
        foregroundColor: Colours.backgroundColor,
        shadowColor: Colors.black12,
        elevation: 0,
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18.sp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12).r,
        ),
      ),
      child: Text(label),
    );
  }
}
