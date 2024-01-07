import '../image_model.dart';
import 'image_dto.dart';

extension ImageMapper on ImageDto {
  ImageModel toImageModel() => ImageModel(
        imageUrl: imageUrl ??
            webFormatUrl ??
            largeImageUrl ??
            fullHdUrl ??
            previewUrl ??
            '',
        previewUrl: previewUrl ?? imageUrl ?? '',
        tags: tags ?? '',
      );
}
