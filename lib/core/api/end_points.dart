class EndPoints{
  static const String baseUrl = "https://pharmacyappp.azurewebsites.net";
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
  static const String createMedicine = "/api/Medicines/";
  static const String updateMedicine = "/api/Medicines/";
  static const String deleteMedicine = "/api/Medicines/";
  static const String getBranches = "/api/Branches/GetByCityAndState";
  static const String profile = "/users/get-by-id";
}