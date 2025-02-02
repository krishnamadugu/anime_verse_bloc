import 'package:equatable/equatable.dart';

class GenreDataRepoModel extends Equatable {
  const GenreDataRepoModel({
    required this.data,
  });

  final List<GenreDatum> data;

  GenreDataRepoModel copyWith({
    List<GenreDatum>? data,
  }) {
    return GenreDataRepoModel(
      data: data ?? this.data,
    );
  }

  factory GenreDataRepoModel.fromJson(Map<String, dynamic> json) {
    return GenreDataRepoModel(
      data: json["data"] == null
          ? []
          : List<GenreDatum>.from(
              json["data"]!.map((x) => GenreDatum.fromJson(x))),
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

class GenreDatum extends Equatable {
  const GenreDatum({
    required this.id,
  });

  final String? id;

  GenreDatum copyWith({
    String? id,
  }) {
    return GenreDatum(
      id: id ?? this.id,
    );
  }

  factory GenreDatum.fromJson(Map<String, dynamic> json) {
    return GenreDatum(
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
      };

  @override
  String toString() {
    return "$id, ";
  }

  @override
  List<Object?> get props => [
        id,
      ];
}
