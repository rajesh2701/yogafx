import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'controller/controller.dart';
import 'model/model.dart';
import 'view/view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final double screenWidth =
  //     MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;

  // if (screenWidth < 500) {
  //   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await firebaseInitilization
      .then((value) => initSettings().then((value) => runApp(const YogaFx())));
}

// INIT SETTINGS
Future<void> initSettings() async =>
    await Settings.init(cacheProvider: SharePreferenceCache());

// INITILIZE THE APP
class YogaFx extends StatefulWidget {
  const YogaFx({super.key});

  @override
  State<YogaFx> createState() => _YogaFxState();
}

class _YogaFxState extends State<YogaFx> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Yoga F(x)',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentTheme.currentTheme(),
          translations: AppTranslations(),
          locale: AppTranslations.getInitialLocale(),
          fallbackLocale: AppTranslations.fallbackLocale,
          supportedLocales: AppTranslations.supportedLocales,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          debugShowCheckedModeBanner: false,
          initialBinding: InitialBinding(),
          //initialRoute: '/loading',
          getPages: appRoutes(),
          home: const ScreenLoading(),
        );
      },
    );
  }
}
