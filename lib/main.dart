import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/injection/injection_container.dart' as injection;
import 'package:qerp_app/core/navigator/app_navigator.dart';
import 'package:qerp_app/core/storage/storage.dart';
import 'package:qerp_app/core/theme/app_theme.dart';
import 'package:qerp_app/core/translation/app_localizations.dart';
import 'package:qerp_app/features/layout_screen/view/cubit/bnb_cubit.dart';
import 'package:qerp_app/features/layout_screen/view/screen/layout_screen.dart';

import 'core/injection/injection_container.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "env/.env");
  await injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => AdaptiveTheme(
        light: AppTheme.appLightTheme,
        dark: AppTheme.appDarkTheme,
        initial: AdaptiveThemeMode.light,
        debugShowFloatingThemeButton: true,
        builder: (theme, darkTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: const ScrollBehavior().copyWith(physics: const BouncingScrollPhysics()),
          theme: theme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(sl<Storage>().getLang()),
          darkTheme: darkTheme,
          navigatorKey: sl<AppNavigator>().navigatorKey,
          home: BlocProvider(
            create: (context) => sl<BnbCubit>(),
            child: const LayoutScreen(),
          ),
        )
      )
    );
  }
}

