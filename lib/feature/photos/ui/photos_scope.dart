import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery/feature/photos/bloc/photos_bloc.dart';
import 'package:image_gallery/feature/photos/data/repository/photo_repository.dart';
import 'package:image_gallery/feature/photos/ui/photos_screen.dart';

class PhotosScope extends StatelessWidget {
  const PhotosScope({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosBloc(
        photoRepository: PhotoRepository(Dio()),
      )..add(PhotosFetch()),
      child: const PhotosScreen(),
    );
  }
}
