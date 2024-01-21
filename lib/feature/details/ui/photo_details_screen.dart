import 'package:flutter/material.dart';
import 'package:image_gallery/feature/photos/data/model/photo.dart';

class PhotoDetails extends StatelessWidget {
  const PhotoDetails({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.name),
      ),
      body: Image.network(
        photo.urlFull,
        fit: BoxFit.fill,
      ),
    );
  }
}
