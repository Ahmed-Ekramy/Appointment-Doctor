class EndPoint {
  static String baseUrl = "https://vcare.integration25.com/api";
  static String register = "/auth/register";
  static String login = "/auth/login";
  static String logout = "/auth/logout";
  static String specialization = "/specialization/index";
  static String recipesDetails ( int id) => "recipes/$id/information";
}
