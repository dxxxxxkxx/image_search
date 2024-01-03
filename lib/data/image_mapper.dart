import 'image_dto.dart';
import '../model/image_item.dart';

extension ImageMapper on ImageDto {
  ImageItem toImageItem() => ImageItem(
      urlSrc: previewUrl ??
          imageUrl ??
          'https://cdn1.iconfinder.com/data/icons/carbon-design-system-vol-6/32/no-image-1024.png');
}
