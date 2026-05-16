import 'package:ecommerce_project/Core/router/app_router.dart';
import 'package:ecommerce_project/Core/utils/app_theme.dart';
import 'package:ecommerce_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //الرقمين دول هما الويدس والهايت بتاع الصفحه  ال متصمم فيها اليو اي في الفيجما
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale: const Locale('en'),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Flutter Demo',
        theme: AppTheme.getlightTheme,
        //كدا هيروح علي الاب راوتر هيلاقي جوا المتغيرر راوتر مسار الكييي مثلا هيروحلها يلاقيها بسلاش فامعنى كدا انها اول واحده الابلكيشن هيستخدمها
        routerConfig: AppRouter.router,
      ),
    );
  }
}
