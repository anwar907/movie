class TopRatedModels {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  TopRatedModels({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory TopRatedModels.fromJson(Map<String, dynamic> json) => TopRatedModels(
      page: json['page'],
      results: json['results'] != null
          ? List<Result>.from(json['results'].map((e) => Result.fromJson(e)))
          : null,
      totalPages: json['total_pages'],
      totalResults: json['total_results']);

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': List<dynamic>.from(results!.map((e) => e.toJson())),
        'total_pages': totalPages,
        'total_results': totalResults
      };
}

class Result {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds:
          json['genre_ids'] != null ? List<int>.from(json['genre_ids']) : null,
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count']);

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': List<int>.from(genreIds!.map((e) => e)),
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount
      };
}
