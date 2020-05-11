class Constants {
  static String topHeadlinesUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

  static String headlinesFor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=$apiKey";
  }

  static String apiKey = "8fa8303737ca441d9417e52672307439";
}