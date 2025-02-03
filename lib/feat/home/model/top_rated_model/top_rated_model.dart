import 'package:equatable/equatable.dart';

class TopRatedAnimeModel extends Equatable {
  const TopRatedAnimeModel({
    required this.data,
  });

  final List<TopRatedAnimeDatum> data;

  TopRatedAnimeModel copyWith({
    List<TopRatedAnimeDatum>? data,
  }) {
    return TopRatedAnimeModel(
      data: data ?? this.data,
    );
  }

  factory TopRatedAnimeModel.fromJson(Map<String, dynamic> json) {
    return TopRatedAnimeModel(
      data: json["data"] == null
          ? []
          : List<TopRatedAnimeDatum>.from(
              json["data"]!.map((x) => TopRatedAnimeDatum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$data, ";
  }

  @override
  List<Object?> get props => [
        data,
      ];
}

class TopRatedAnimeDatum extends Equatable {
  const TopRatedAnimeDatum({
    required this.id,
    required this.title,
    required this.alternativeTitles,
    required this.ranking,
    required this.genres,
    required this.episodes,
    required this.hasEpisode,
    required this.hasRanking,
    required this.image,
    required this.link,
    required this.status,
    required this.synopsis,
    required this.thumb,
    required this.type,
  });

  final String? id;
  final String? title;
  final List<String> alternativeTitles;
  final int? ranking;
  final List<String> genres;
  final int? episodes;
  final bool? hasEpisode;
  final bool? hasRanking;
  final String? image;
  final String? link;
  final String? status;
  final String? synopsis;
  final String? thumb;
  final String? type;

  TopRatedAnimeDatum copyWith({
    String? id,
    String? title,
    List<String>? alternativeTitles,
    int? ranking,
    List<String>? genres,
    int? episodes,
    bool? hasEpisode,
    bool? hasRanking,
    String? image,
    String? link,
    String? status,
    String? synopsis,
    String? thumb,
    String? type,
  }) {
    return TopRatedAnimeDatum(
      id: id ?? this.id,
      title: title ?? this.title,
      alternativeTitles: alternativeTitles ?? this.alternativeTitles,
      ranking: ranking ?? this.ranking,
      genres: genres ?? this.genres,
      episodes: episodes ?? this.episodes,
      hasEpisode: hasEpisode ?? this.hasEpisode,
      hasRanking: hasRanking ?? this.hasRanking,
      image: image ?? this.image,
      link: link ?? this.link,
      status: status ?? this.status,
      synopsis: synopsis ?? this.synopsis,
      thumb: thumb ?? this.thumb,
      type: type ?? this.type,
    );
  }

  factory TopRatedAnimeDatum.fromJson(Map<String, dynamic> json) {
    return TopRatedAnimeDatum(
      id: json["_id"],
      title: json["title"],
      alternativeTitles: json["alternativeTitles"] == null
          ? []
          : List<String>.from(json["alternativeTitles"]!.map((x) => x)),
      ranking: json["ranking"],
      genres: json["genres"] == null
          ? []
          : List<String>.from(json["genres"]!.map((x) => x)),
      episodes: json["episodes"],
      hasEpisode: json["hasEpisode"],
      hasRanking: json["hasRanking"],
      image: json["image"],
      link: json["link"],
      status: json["status"],
      synopsis: json["synopsis"],
      thumb: json["thumb"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "alternativeTitles": alternativeTitles.map((x) => x).toList(),
        "ranking": ranking,
        "genres": genres.map((x) => x).toList(),
        "episodes": episodes,
        "hasEpisode": hasEpisode,
        "hasRanking": hasRanking,
        "image": image,
        "link": link,
        "status": status,
        "synopsis": synopsis,
        "thumb": thumb,
        "type": type,
      };

  @override
  String toString() {
    return "$id, $title, $alternativeTitles, $ranking, $genres, $episodes, $hasEpisode, $hasRanking, $image, $link, $status, $synopsis, $thumb, $type, ";
  }

  @override
  List<Object?> get props => [
        id,
        title,
        alternativeTitles,
        ranking,
        genres,
        episodes,
        hasEpisode,
        hasRanking,
        image,
        link,
        status,
        synopsis,
        thumb,
        type,
      ];
}
