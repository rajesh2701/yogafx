import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'controller/controller.dart';
import 'model/model.dart';
import 'view/view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await firebaseInitilization
      .then((value) => initSettings().then((value) => runApp(const YogaFX())));
}

// INIT SETTINGS
Future<void> initSettings() async =>
    await Settings.init(cacheProvider: SharePreferenceCache());

//INITILIZE THE APP HERE
class YogaFX extends StatelessWidget {
  const YogaFX({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => GetMaterialApp(
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
              getPages: appRoutes(),
              home: const ScreenLoading(),
            ),
        designSize: const Size(428, 926),
        minTextAdapt: true);
  }
}

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
          getPages: appRoutes(),
          home: const ScreenLoading(),
        );
      },
    );
  }
}
