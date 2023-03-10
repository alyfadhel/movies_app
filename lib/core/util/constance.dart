class AppConstance
{
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String nowPlayingMoviesPath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String apiKey = '740ca5e7fc5fd2770595d34f1ec7ca74';
  static const String popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String upComingMoviesPath = '$baseUrl/movie/upcoming?api_key=$apiKey';
  static const String onTheAirTvsPath = '$baseUrl/tv/on_the_air?api_key=$apiKey';
  static const String popularTvsPath = '$baseUrl/tv/popular?api_key=$apiKey';
  static const String topRatedTvsPath = '$baseUrl/tv/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path)=>'$baseImageUrl$path';
}