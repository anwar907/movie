class NowPlayingModels {
  Dates? dates;
  num? page;
  List<Result>? results;
  num? totalPages;
  num? totalResults;

  NowPlayingModels({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory NowPlayingModels.fromJson(Map<String, dynamic> json) =>
      NowPlayingModels(
          dates: json['dates'] != null ? Dates.fromJson(json['dates']) : null,
          page: json['page'],
          results: json['results'] != null
              ? List<Result>.from(
                  json['results'].map((e) => Result.fromJson(e)))
              : null,
          totalPages: json['total_pages'],
          totalResults: json['total_results']);

  Map<String, dynamic> toJson() => {
        'dates': dates?.toJson(),
        'page': page,
        'results': List<dynamic>.from(results!.map((e) => e.toJson())),
        'total_pages': totalPages,
        'total_results': totalResults
      };
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({
    this.maximum,
    this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) =>
      Dates(maximum: json['maximum'], minimum: json['minimum']);

  Map<String, dynamic> toJson() => {'maximum': maximum, 'minimum': minimum};
}

class Result {
  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

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
          json['genre_ids'] != null ? List<num>.from(json['genre_ids']) : null,
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
        'genre_ids': List<dynamic>.from(genreIds!.map((e) => e)),
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
