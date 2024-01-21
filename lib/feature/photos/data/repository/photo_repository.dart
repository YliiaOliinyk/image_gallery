import 'package:dio/dio.dart';
import 'package:image_gallery/feature/photos/data/model/photo.dart';

class PhotoRepository {
  final Dio dio;

  PhotoRepository(this.dio);

  Future<List<Photo>> getPhotos() async {
    final dio = Dio();
    final dioResult = await dio.get(
      'https://api.unsplash.com/photos?page=1',
      options: Options(
        headers: {'Authorization': 'Client-ID cat9Z9TdOF-DVwi8RnqiRiW4-wWOzHnqGez3Tb4Qnw8'},
      ),
    );
    if (dioResult.statusCode == 200) {
      final List<dynamic> data = dioResult.data;
      final List<Photo> photos = data.map((e) => Photo.fromJson(e)).toList();
      return photos;
    } else {
      throw Exception(dioResult.statusMessage);
    }
  }
}
