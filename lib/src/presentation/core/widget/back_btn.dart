import 'package:flutter/material.dart';
import 'package:interview_task/src/presentation/core/constants/app_colors.dart';

class CustomBackBtn extends StatelessWidget {
  final Function()? onPressed;
  final Icon? icon;
  final Color? backGroundColor;
  const CustomBackBtn({super.key, this.onPressed, this.icon, this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 6,
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
            backgroundColor: backGroundColor ?? Theme.of(context).cardTheme.color),
        onPressed: onPressed ??
            () {
              Navigator.pop(context);
            },
        child: icon ??
            const Icon(
              Icons.arrow_back,
              color: AppColors.lightGrey,
            ));
  }
}
