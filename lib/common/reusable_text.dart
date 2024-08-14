import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableText extends StatelessWidget {
  const ReusableText(
    this.text, {
    super.key,
    this.size = 14,
    this.color,
    this.weight,
    this.family,
    this.wordSpacing,
    this.letterSpacing,
    this.height,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  final String text;
  final double size;
  final Color? color;
  final FontWeight? weight;
  final String? family;
  final double? wordSpacing;
  final double? letterSpacing;
  final double? height;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: family,
        fontWeight: weight,
        color: color ?? Colors.black,
        fontSize: size.sp,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
      ),
    );
  }
}
