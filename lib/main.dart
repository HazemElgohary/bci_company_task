import 'package:bci_company_task/app/config/theme.dart';
import 'package:bci_company_task/app/config/translate/messages.dart';
import 'package:bci_company_task/app/helpers/keys.dart';
import 'package:bci_company_task/app/helpers/prefs.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';

import 'app/inject.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async{
  await inject();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (BuildContext context) =>GetMaterialApp(
        title: "BCI task",
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        locale: Locale(Prefs.getString(PrefsKeys.lang).isEmpty
            ? 'en'
            : Prefs.getString(PrefsKeys.lang)),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        theme: buildTheme(context),
        translations: Messages(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        fallbackLocale: const Locale('ar'),
      ),
    ),
  );
}
