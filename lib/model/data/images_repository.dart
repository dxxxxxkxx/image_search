import '../image_item.dart';
import 'image_dto.dart';
import 'image_mapper.dart';
import 'images_api.dart';

class ImagesRepository {
  final ImagesApi _imagesApi;

  ImagesRepository() : _imagesApi = ImagesApi();

  Future<List<ImageItem>> getImages({String query = ''}) async {
    final List<dynamic> jsonImages =
        await _imagesApi.getJsonImages(query: query);

    return jsonImages
        .map((jsonImage) => ImageDto.fromJson(jsonImage).toImageItem())
        .where((image) => image.imageUrl.isNotEmpty)
        .toList();
  }
}
