import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_task/src/infrastructure/core/check_internet/check_internet_connectivity.dart';
import 'package:interview_task/src/presentation/core/constants/app_colors.dart';
import 'package:interview_task/src/presentation/core/constants/app_images.dart';
import 'package:interview_task/src/presentation/core/theme/typography.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).cardTheme.color,
        systemNavigationBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: SizedBox(
            height: kSize.height,
            width: kSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.noInternetImage,
                  height: kSize.height * 0.15,
                  width: kSize.height * 0.15,
                ),
                Text(
                  "Sorry",
                  style: AppTypography.interBold.copyWith(
                    color: const Color(0xFF767676),
                    fontSize: 15,
                  ),
                ),
                Center(
                    child: Text(
                  "No Internet Connection",
                  style: AppTypography.interBold.copyWith(
                    color: const Color(0xFF767676),
                    fontSize: 15,
                  ),
                )),
                // if (Platform.isIOS)
                IconButton(
                    onPressed: () async {
                      if (await CheckInternet(parentContext: context).checkInternet()) {
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    icon: const Icon(Icons.replay, color: AppColors.black //getTextColor(context),
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
