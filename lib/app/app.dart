import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/app/injector/injector.dart';
import 'package:interview_task/app/router/router.dart';
import 'package:interview_task/app/router/router_constant.dart';
import 'package:interview_task/src/application/auth/auth_bloc.dart';
import 'package:interview_task/src/presentation/core/constants/app_strings.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
      ],
      child: const MaterialApp(
        title: AppStrings.appTitle,
        initialRoute: RouterConstant.loginRoute,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
