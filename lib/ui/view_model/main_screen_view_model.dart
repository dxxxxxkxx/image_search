import 'dart:async';

import '../../model/data/images_repository.dart';
import '../../model/image_model.dart';

class MainScreenViewModel {
  final StreamController<bool> _controller;
  final ImagesRepository _repository;
  List<ImageModel> _images;

  MainScreenViewModel()
      : _controller = StreamController(),
        _repository = ImagesRepository(),
        _images = [] {
    _initImages();
  }

  Stream<bool> get isLoaded => _controller.stream;

  List<ImageModel> get images => _images;

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
