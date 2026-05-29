import 'dart:async';

import 'package:ecommerce_project/Core/networking/api_interceptors.dart';
import 'package:ecommerce_project/Core/router/app_router.dart';
import 'package:ecommerce_project/Core/router/app_routes.dart';
import 'package:ecommerce_project/Core/services/getit_service.dart';
import 'package:ecommerce_project/Core/utils/app_theme.dart';
import 'package:ecommerce_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // لازم اناديها قبل اي شيرد بريفرنسس او سيكيور ستوردج
  await setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<AuthEvent>
  _authSubscription; // علشان محتاج اسمع لل ايفنتس ولازم الويجت تبقا سيتفول علشان اعرف اسمع لل ايفنت
  @override
  void initState() {
    super.initState();
    _authSubscription = AuthEventBus.instance.stream.listen((event) {
      if (event == AuthEvent.logout) {
        // لو حصل لوج اوت روح مباشره على شاشه اللوج ان
        AppRouter.router.go(AppRoutes.kAuthLoginView);
      }
    });
  }

  @override
  void dispose() {
    // علشان ميبقاش فيه ميموري لييك بقفل الاستريم بعد حذف الويدجت
    _authSubscription.cancel();
    super.dispose();
  }

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
