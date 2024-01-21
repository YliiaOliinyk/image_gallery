part of 'photos_bloc.dart';


sealed class PhotosState {}

class PhotosLoading extends PhotosState {}

class PhotosLoaded extends PhotosState {
  PhotosLoaded(this.photos);
  final List<Photo> photos;
}

class PhotosError extends PhotosState {
  PhotosError(this.message);
  final String message;
}