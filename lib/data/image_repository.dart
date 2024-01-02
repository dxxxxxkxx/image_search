import 'image_dto.dart';
import 'images_api.dart';

class ImageRepository {
  final ImagesApi _imagesApi;

  ImageRepository() : _imagesApi = ImagesApi();

  Future<List<ImageDto>> getImages({String query = ''}) async {
    final List<dynamic> images = await _imagesApi.getImages(query: query);

    return images.map((image) => ImageDto.fromJson(image)).toList();
  }
}
