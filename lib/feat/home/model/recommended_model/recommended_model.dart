class RecommendAnimationModel {
  RecommendAnimationModel({
    required this.data,
    required this.meta,
  });

  final List<RecommendedAnimationDatum> data;
  final Meta? meta;

  factory RecommendAnimationModel.fromJson(Map<String, dynamic> json) {
    return RecommendAnimationModel(
      data: json["data"] == null
          ? []
          : List<RecommendedAnimationDatum>.from(
              json["data"]!.map((x) => RecommendedAnimationDatum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
        "meta": meta?.toJson(),
      };

  @override
  String toString() {
    return "$data, $meta, ";
  }
}

class RecommendedAnimationDatum {
  RecommendedAnimationDatum({
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

  factory RecommendedAnimationDatum.fromJson(Map<String, dynamic> json) {
    return RecommendedAnimationDatum(
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
}

class Meta {
  Meta({
    required this.page,
    required this.size,
    required this.totalData,
    required this.totalPage,
  });

  final int? page;
  final int? size;
  final int? totalData;
  final int? totalPage;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json["page"],
      size: json["size"],
      totalData: json["totalData"],
      totalPage: json["totalPage"],
    );
  }

  Map<String, dynamic> toJson() => {
        "page": page,
        "size": size,
        "totalData": totalData,
        "totalPage": totalPage,
      };

  @override
  String toString() {
    return "$page, $size, $totalData, $totalPage, ";
  }
}
