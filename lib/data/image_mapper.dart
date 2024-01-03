import '../model/image_item.dart';
import 'image_dto.dart';

extension ImageMapper on ImageDto {
  static const String _noImageSrc =
      'https://cdn1.iconfinder.com/data/icons/carbon-design-system-vol-6/32/no-image-1024.png';

  ImageItem toImageItem() => ImageItem(
      previewUrl: previewUrl ?? imageUrl ?? _noImageSrc,
      imageUrl: imageUrl ?? _noImageSrc,
      tags: tags ?? '');
}
