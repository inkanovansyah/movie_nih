import 'package:movie_nih/tv_shows/domain/usecases/get_season_details_usecase.dart';

/// A class that holds all the API constants used in the application.
///
/// This includes base URLs for different types of media (movies, TV shows),
/// placeholders for images, and specific paths for various API endpoints.
class ApiConstants {
  /// The API key used to authenticate requests to The Movie Database (TMDb) API.
  static const String apiKey = '16f8a149fcdef1b6f9e5e2e46c6e6018';

  /// The base URL for the TMDb API.
  static const String baseUrl = 'https://api.themoviedb.org/3';

  // Image base URLs
  /// The base URL for fetching backdrop images.
  static const String baseBackdropUrl = 'https://image.tmdb.org/t/p/w1280';

  /// The base URL for fetching poster images.
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';

  /// The base URL for fetching profile images.
  static const String baseProfileUrl = 'https://image.tmdb.org/t/p/w300';

  /// The base URL for fetching still images.
  static const String baseStillUrl = 'https://image.tmdb.org/t/p/w500';

  /// The base URL for fetching avatar images.
  static const String baseAvatarUrl = 'https://image.tmdb.org/t/p/w185';

  /// The base URL for fetching videos from YouTube.
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';

  // Placeholder URLs
  /// The placeholder image URL for movies when no image is available.
  static const String moviePlaceHolder =
      'https://davidkoepp.com/wp-content/themes/blankslate/images/Movie%20Placeholder.jpg';

  /// The placeholder image URL for cast members when no image is available.
  static const String castPlaceHolder =
      'https://palmbayprep.org/wp-content/uploads/2015/09/user-icon-placeholder.png';

  /// The placeholder image URL for avatars when no image is available.
  static const String avatarPlaceHolder =
      'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049__480.png';

  /// The placeholder image URL for still images when no image is available.
  static const String stillPlaceHolder =
      'https://popcornsg.s3.amazonaws.com/gallery/1577405144-six-year.png';

  // Authentication paths
  /// The path to create a new guest session for authentication.
  static const String authentication =
      '$baseUrl/movie/authentication/guest_session/new?api_key=$apiKey';

  // Movie API paths
  /// The path to fetch the list of movies currently playing in theaters.
  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  /// The path to fetch the list of popular movies.
  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  /// The path to fetch the list of top-rated movies.
  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  /// Returns the path to fetch the details of a specific movie by its ID.
  ///
  /// The response includes videos, credits, reviews, and similar movies.
  static String getMovieDetailsPath(int movieId) {
    return '$baseUrl/movie/$movieId?api_key=$apiKey&append_to_response=videos,credits,reviews,similar';
  }

  /// Returns the path to fetch all popular movies with pagination.
  static String getAllPopularMoviesPath(int page) {
    return '$baseUrl/movie/popular?api_key=$apiKey&page=$page';
  }

  /// Returns the path to fetch all top-rated movies with pagination.
  static String getAllTopRatedMoviesPath(int page) {
    return '$baseUrl/movie/top_rated?api_key=$apiKey&page=$page';
  }

  // TV Shows API paths
  /// The path to fetch the list of TV shows currently on air.
  static const String onAirTvShowsPath =
      '$baseUrl/tv/on_the_air?api_key=$apiKey&with_original_language=en';

  /// The path to fetch the list of popular TV shows.
  static const String popularTvShowsPath =
      '$baseUrl/tv/popular?api_key=$apiKey&with_original_language=en';

  /// The path to fetch the list of top-rated TV shows.
  static const String topRatedTvShowsPath =
      '$baseUrl/tv/top_rated?api_key=$apiKey&with_original_language=en';

  /// Returns the path to fetch the details of a specific TV show by its ID.
  ///
  /// The response includes similar shows and videos.
  static String getTvShowDetailsPath(int tvShowId) {
    return '$baseUrl/tv/$tvShowId?api_key=$apiKey&append_to_response=similar,videos';
  }

  /// Returns the path to fetch the details of a specific season of a TV show.
  static String getSeasonDetailsPath(SeasonDetailsParams params) {
    return '$baseUrl/tv/${params.id}/season/${params.seasonNumber}?api_key=$apiKey';
  }

  /// Returns the path to fetch all popular TV shows with pagination.
  static String getAllPopularTvShowsPath(int page) {
    return '$baseUrl/tv/popular?api_key=$apiKey&page=$page&with_original_language=en';
  }

  /// Returns the path to fetch all top-rated TV shows with pagination.
  static String getAllTopRatedTvShowsPath(int page) {
    return '$baseUrl/tv/top_rated?api_key=$apiKey&page=$page&with_original_language=en';
  }

  // Search API path
  /// Returns the path to search for movies, TV shows, or people by title.
  static String getSearchPath(String title) {
    return '$baseUrl/search/multi?api_key=$apiKey&query=$title';
  }
}
