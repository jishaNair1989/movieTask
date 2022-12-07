

import 'dart:convert';

MovieRespModel movieRespModelFromJson(String str) => MovieRespModel.fromJson(json.decode(str));


class MovieRespModel {
  MovieRespModel({
    this.result,
    this.queryParam,
    this.code,
    this.message,
  });

  List<Result>? result;
  QueryParam? queryParam;
  int? code;
  String? message;

  factory MovieRespModel.fromJson(Map<String, dynamic> json) => MovieRespModel(
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    queryParam: QueryParam.fromJson(json["queryParam"]),
    code: json["code"],
    message: json["message"],
  );


}

class QueryParam {
  QueryParam({
    this.category,
    this.language,
    this.genre,
    this.sort,
  });

  String? category;
  String? language;
  String? genre;
  String? sort;

  factory QueryParam.fromJson(Map<String, dynamic> json) => QueryParam(
    category: json["category"],
    language: json["language"],
    genre: json["genre"],
    sort: json["sort"],
  );


}

class Result {
  Result({
    this.id,
    this.director,
    this.writers,
    this.stars,
    this.releasedDate,
    this.productionCompany,
    this.title,
    this.language,
    this.runTime,
    this.genre,
    this.voted,
    this.poster,
    this.pageViews,
    this.description,
    this.upVoted,
    this.downVoted,
    this.totalVoted,
    this.voting,
  });

  String? id;
  List<String>? director;
  List<String>? writers;
  List<String>? stars;
  int? releasedDate;
  List<String>? productionCompany;
  String? title;
  Language? language;
  int? runTime;
  String? genre;
  List<Voted>? voted;
  String? poster;
  int? pageViews;
  String? description;
  List<String>? upVoted;
  List<String>? downVoted;
  int? totalVoted;
  int? voting;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    director: List<String>.from(json["director"].map((x) => x)),
    writers: List<String>.from(json["writers"].map((x) => x)),
    stars: List<String>.from(json["stars"].map((x) => x)),
    releasedDate: json["releasedDate"],
    productionCompany: List<String>.from(json["productionCompany"].map((x) => x)),
    title: json["title"],
    language: languageValues.map[json["language"]],
    runTime: json["runTime"] == null ? null : json["runTime"],
    genre: json["genre"],
    voted: List<Voted>.from(json["voted"].map((x) => Voted.fromJson(x))),
    poster: json["poster"],
    pageViews: json["pageViews"],
    description: json["description"],
    upVoted: json["upVoted"] == null ? null : List<String>.from(json["upVoted"].map((x) => x)),
    downVoted: json["downVoted"] == null ? null : List<String>.from(json["downVoted"].map((x) => x)),
    totalVoted: json["totalVoted"],
    voting: json["voting"],
  );


}

enum Language { KANNADA }

final languageValues = EnumValues({
  "Kannada": Language.KANNADA
});

class Voted {
  Voted({
    this.upVoted,
    this.downVoted,
    this.id,
    this.updatedAt,
    this.genre,
  });

  List<String>? upVoted;
  List<dynamic>? downVoted;
  String? id;
  int? updatedAt;
  String? genre;

  factory Voted.fromJson(Map<String, dynamic> json) => Voted(
    upVoted: List<String>.from(json["upVoted"].map((x) => x)),
    downVoted: List<dynamic>.from(json["downVoted"].map((x) => x)),
    id: json["_id"],
    updatedAt: json["updatedAt"],
    genre: json["genre"],
  );


}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
