import 'package:flutter/material.dart';
import 'package:interview_task/src/presentation/core/constants/app_images.dart';
import 'package:interview_task/src/presentation/core/theme/typography.dart';

Widget noRecordFound(BuildContext context, Size kSize) => SizedBox(
      width: kSize.width,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Center(
              child: Image.asset(
                AppImages.notFoundImage,
                // 'assets/icons/no-data-found.png',
                height: 150,
                width: 150,
              ),
            ),
            Center(
              child: Text(
                "No Records Found", //.toLocalize(context),
                style: AppTypography.interBold.merge(
                    const TextStyle(color: Color(0xFFC2C2C2), fontSize: 15, fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
