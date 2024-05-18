class EndPoints{
  static const String baseUrl = "https://roshetta.azurewebsites.net/";
  static const String register = "/users/register/";
  static const String login = "/users/authenticate";
  static const String forgetPassword = "/users/forgot-password";
  static const String resetPassword = "/users/reset-password";
  static const String getAllCategories = "/api/categories";
  static const String getMedicinesByCategoryId = "/api/Medicines/GetByCategory/";
  static const String addItemToCart = "/api/CartItems";
  static const String getAllCartItems = "/api/CartItems/";
  static const String updateCartItem = "/api/CartItems";
  static const String deleteCartItem = "/api/CartItems/";
}