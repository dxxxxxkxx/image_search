import 'dart:async';

import '../data/image_dto.dart';
import '../data/image_repository.dart';

class MainScreenViewModel {
  final StreamController<bool> _controller;
  final ImageRepository _repository;
  List<ImageDto> _images;

  MainScreenViewModel()
      : _controller = StreamController(),
        _repository = ImageRepository(),
        _images = [] {
    _initImages();
  }

  Stream<bool> get isLoaded => _controller.stream;

  List<ImageDto> get images => _images;

  Future<void> _initImages() async {
    _images = await _repository.getImages();
    _controller.add(true);
  }

  Future<void> searchImages({String query = ''}) async {
    _controller.add(false);
    _images = await _repository.getImages(query: query);
    _controller.add(true);
  }
}
