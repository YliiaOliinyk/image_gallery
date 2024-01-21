import 'package:flutter/material.dart';
import 'package:image_gallery/feature/photos/ui/photos_scope.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotosScope(),
    );
  }
}
