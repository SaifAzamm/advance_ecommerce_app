class ListAPI {
  ListAPI._();

  ///Development
  static const String baseurl = "https://fakestoreapi.com/";

  ///login
  static const String login = "${baseurl}auth/login";

  ///Get categories
  static const String getCategories = "${baseurl}products/categories";

  ///Get products
  static const String getProducts = "${baseurl}products";
}
