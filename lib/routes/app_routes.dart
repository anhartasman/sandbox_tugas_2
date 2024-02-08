abstract class Routes {
  static const homeRoute = Paths.homePath;
  static const courseDetailRoute = Paths.courseDetailPath;
  static const homeMenuRoute = Paths.homeMenuPath;
  static const authLoginRoute = Paths.authLoginPath;
  static const authRegisterRoute = Paths.authRegisterPath;
}

abstract class Paths {
  static const homePath = "/";
  static const homeMenuPath = "/homeMenu";
  static const courseDetailPath = "/courseDetail";
  static const authLoginPath = "/authLogin";
  static const authRegisterPath = "/authRegister";
}
