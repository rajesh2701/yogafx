// ignore_for_file: unnecessary_overrides

import 'package:get/route_manager.dart';
import 'package:yogafx/view/view.dart';

appRoutes() => [
      GetPage(name: '/loading', page: () => const ScreenLoading()),
      GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
          middlewares: [MyMiddelware()],
          transition: Transition.circularReveal,
          transitionDuration: const Duration(milliseconds: 700)),
      GetPage(
          name: '/login',
          page: () => ScreenLogin(),
          middlewares: [MyMiddelware()],
          transition: Transition.downToUp,
          transitionDuration: const Duration(milliseconds: 600)),
      GetPage(
          name: '/register',
          page: () => ScreenRegister(),
          middlewares: [MyMiddelware()],
          transition: Transition.downToUp,
          transitionDuration: const Duration(milliseconds: 600)),
      GetPage(
          name: '/forgotpassword',
          page: () => ScreenForgotPassword(),
          middlewares: [MyMiddelware()],
          transition: Transition.downToUp,
          transitionDuration: const Duration(milliseconds: 600)),
      GetPage(
          name: '/home',
          page: () => const ScreenHome(),
          middlewares: [MyMiddelware()],
          transition: Transition.zoom,
          transitionDuration: const Duration(milliseconds: 700)),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    //print(page?.name);
    return super.onPageCalled(page);
  }
}
