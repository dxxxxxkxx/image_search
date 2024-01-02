import 'image_dto.dart';

extension ImageMapper on ImageDto {
  ImageDto toImageDto() => ImageDto(
      imageUrl: imageUrl ??
          previewUrl ??
          'https://cdn1.iconfinder.com/data/icons/carbon-design-system-vol-6/32/no-image-1024.png',
      tags: tags ?? '');
}
