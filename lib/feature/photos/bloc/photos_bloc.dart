import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery/feature/photos/data/model/photo.dart';
import 'package:image_gallery/feature/photos/data/repository/photo_repository.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final PhotoRepository photoRepository;

  PhotosBloc({
    required this.photoRepository,
  }) : super(PhotosLoading()) {
    on<PhotosFetch>((event, emit) async {
      emit(PhotosLoading());

      try {
        final photos = await photoRepository.getPhotos();

        emit(PhotosLoaded(photos));
      } catch (e) {
        emit(PhotosError(e.toString()));
      }
    });
  }
}
