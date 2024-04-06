class MovieModel {
  final String id;
  final String overview;
  final String title;
  final String posterPath;

  MovieModel({
    required this.id,
    required this.overview,
    required this.title,
    required this.posterPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      overview: json['overview'],
      title: json['title'],
      posterPath: json['poster_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'overview': overview,
      'title': title,
      'poster_path': posterPath,
    };
  }
}
