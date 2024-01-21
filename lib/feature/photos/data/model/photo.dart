class Photo {
  final String id;
  final String name;
  final String auhtor;
  final String urlSmall;
  final String urlFull;

  Photo({
    required this.id,
    required this.name,
    required this.auhtor,
    required this.urlSmall,
    required this.urlFull,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      // Я використала короткий опис тому що в цьому АПІ в фото немає назви
      name: json['alt_description'],
      auhtor: json['user']['name'],
      urlSmall: json['urls']['small'],
      urlFull: json['urls']['full'],
    );
  }
}
