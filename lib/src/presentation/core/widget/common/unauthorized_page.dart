import 'package:flutter/material.dart';
import 'package:interview_task/src/presentation/core/constants/app_colors.dart';
import 'package:interview_task/src/presentation/core/constants/app_constants.dart';
import 'package:interview_task/src/presentation/core/constants/app_images.dart';
import 'package:interview_task/src/presentation/core/theme/typography.dart';
import 'package:interview_task/src/presentation/core/widget/back_btn.dart';

class UnauthorizedPage extends StatelessWidget {
  const UnauthorizedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const Padding(
          padding: EdgeInsets.only(left: AppConstants.basePadding, top: AppConstants.basePadding),
          child: CustomBackBtn(),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.notAuthorizedImage,
              height: kSize.height * 0.18,
            ),
            SizedBox(
              height: kSize.height * 0.03,
            ),
            SizedBox(
              width: kSize.width * 0.4,
              child: Text(
                "Not Authorized", // AppLocalizations.of(context)!.translate('NOT_AUTHORIZED')!,
                textAlign: TextAlign.center,
                style: AppTypography.interSemiBold.copyWith(color: AppColors.lightGrey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
