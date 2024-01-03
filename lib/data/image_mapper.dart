import '../model/image_item.dart';
import 'image_dto.dart';

extension ImageMapper on ImageDto {
  ImageItem toImageItem() => ImageItem(
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
