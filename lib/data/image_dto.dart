import 'package:flutter/material.dart';

@immutable
class ImageDto {
  final String? imageUrl;
  final String? previewUrl;
  final String? tags;

  const ImageDto({this.imageUrl, this.previewUrl, this.tags});

  ImageDto.fromJson(Map<String, dynamic> json)
      : imageUrl = json['imageURL'],
        previewUrl = json['previewURL'],
        tags = json['tags'];

  Map<String, dynamic> toJson() => {
        'imageURL': imageUrl,
        'previewURL': previewUrl,
        'tags': tags,
      };

  @override
  String toString() =>
      'ImageDto{ imageUrl: $imageUrl, previewUrl: $previewUrl, tags: $tags}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageDto &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          previewUrl == other.previewUrl &&
          tags == other.tags);

  @override
  int get hashCode => imageUrl.hashCode ^ previewUrl.hashCode ^ tags.hashCode;

  ImageDto copyWith({
    String? imageUrl,
    String? previewUrl,
    String? tags,
  }) =>
      ImageDto(
        imageUrl: imageUrl ?? this.imageUrl,
        previewUrl: previewUrl ?? this.previewUrl,
        tags: tags ?? this.tags,
      );
}
