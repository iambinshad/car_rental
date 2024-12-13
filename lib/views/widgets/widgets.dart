import 'package:flutter/material.dart';
import 'package:rental_app_demo/utils/themes/app_colors.dart';


class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? fontSize;
  final FontWeight? fontWeight;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ) ??
          TextStyle(
            color: color ?? AppColors.textPrimary,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}


class PrimaryElevateButton extends StatelessWidget {
  final buttonName;
  final isGrey;
  final ontap;
  const PrimaryElevateButton({
    this.ontap,
    this.buttonName,this.isGrey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ElevatedButton(
        onPressed:ontap??(){},
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor:isGrey!=null?const Color(0xFFE6EFEB):AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child:  AppText(buttonName??"Book Now",color:isGrey!=null?AppColors.primary: AppColors.white,),
      ),
    );
  }
}