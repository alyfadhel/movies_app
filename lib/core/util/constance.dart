class AppConstance
{
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String nowPlayingMoviesPath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String apiKey = '740ca5e7fc5fd2770595d34f1ec7ca74';
  static const String popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';

}