import 'package:flutter/material.dart';
import 'package:interview_task/src/presentation/core/constants/app_colors.dart';
import 'package:interview_task/src/presentation/core/theme/typography.dart';

class FooterButton extends StatelessWidget {
  final Function() onPressed;
  final double? height;
  final String label;
  final double? width;
  const FooterButton({super.key, required this.onPressed, this.height, required this.label, this.width});

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return SizedBox(
      height: height ?? kSize.height * 0.060,
      width: width ?? kSize.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: kSize.height * 0.02),
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: AppTypography.interBold.copyWith(
            fontSize: 15,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
