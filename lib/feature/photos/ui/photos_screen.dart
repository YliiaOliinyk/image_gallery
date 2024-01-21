import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery/feature/photos/bloc/photos_bloc.dart';
import 'package:image_gallery/feature/photos/data/model/photo.dart';
import 'package:image_gallery/feature/photos/ui/photo_item.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Gallery'),
        ),
        body: BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {
            return switch (state) {
              PhotosLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              PhotosLoaded(:final photos) => _FetchedBody(photos: photos),
              PhotosError(:final message) => _ErrorBody(message: message),
            };
          },
        ));
  }
}

class _FetchedBody extends StatelessWidget {
  final List<Photo> photos;

  const _FetchedBody({
    required this.photos,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: photos.length,
      itemBuilder: (BuildContext context, int index) {
        return PhotoItem(
          photo: photos[index],
        );
      },
    );
  }
}

class _ErrorBody extends StatelessWidget {
  final String message;

  const _ErrorBody({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () {
              context.read<PhotosBloc>().add(PhotosFetch());
            },
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
