class Apis {
//For Local Dev
  static String base_url_images = "https://dummyjson.com";
  // static String base_url_images = "http://192.168.243.77:2017";
  // static const String url_images =
  //     'https://flip-api-public.s3.ap-south-1.amazonaws.com/development';

  Apis() {}

  static String base_url = base_url_images;

  static const String favourite = '/favorite';

  static const String login = '/auth/login';
  static const String register = '/register';
  static const String getAllProducts = '/products';
}
