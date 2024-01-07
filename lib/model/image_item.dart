import 'package:flutter/material.dart';

@immutable
class ImageItem {
  final String previewUrl;
  final String imageUrl;
  final String tags;

  const ImageItem({
    required this.previewUrl,
    required this.imageUrl,
    required this.tags,
  });

  @override
  String toString() =>
      'ImageItem{ previewUrl: $previewUrl, imageUrl: $imageUrl, tags: $tags }';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageItem &&
          runtimeType == other.runtimeType &&
          previewUrl == other.previewUrl &&
          imageUrl == other.imageUrl &&
          tags == other.tags);

  @override
  int get hashCode => previewUrl.hashCode ^ imageUrl.hashCode ^ tags.hashCode;

  ImageItem copyWith({
    String? previewUrl,
    String? imageUrl,
    String? tags,
  }) =>
      ImageItem(
        previewUrl: previewUrl ?? this.previewUrl,
        imageUrl: imageUrl ?? this.imageUrl,
        tags: tags ?? this.tags,
      );
}
