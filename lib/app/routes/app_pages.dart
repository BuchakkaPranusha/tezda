import 'package:get/get.dart';

import '../modules/error_screen/bindings/error_screen_binding.dart';
import '../modules/error_screen/views/error_screen_view.dart';
import '../modules/favourates_page_view/bindings/favourates_page_view_binding.dart';
import '../modules/favourates_page_view/views/favourates_page_view_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/product_details_page/bindings/product_details_page_binding.dart';
import '../modules/product_details_page/views/product_details_page_view.dart';
import '../modules/products_page/bindings/products_page_binding.dart';
import '../modules/products_page/views/products_page_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/registration_page/bindings/registration_page_binding.dart';
import '../modules/registration_page/views/registration_page_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_middleware.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION_PAGE,
      page: () => const RegistrationPageView(),
      binding: RegistrationPageBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS_PAGE,
      page: () => const ProductsPageView(),
      binding: ProductsPageBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS_PAGE,
      page: () => const ProductDetailsPageView(),
      binding: ProductDetailsPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ERROR_SCREEN,
      page: () => ErrorScreenView(),
      binding: ErrorScreenBinding(),
    ),
    GetPage(
        name: _Paths.SPLASH_SCREEN,
        page: () => SplashScreenView(),
        binding: SplashScreenBinding(),
        middlewares: [SplashMiddleware()]),
    GetPage(
      name: _Paths.FAVOURATES_PAGE_VIEW,
      page: () => const FavouratesPageViewView(),
      binding: FavouratesPageViewBinding(),
    ),
  ];
}
