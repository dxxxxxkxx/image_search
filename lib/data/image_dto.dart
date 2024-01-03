import 'package:flutter/material.dart';

@immutable
class ImageDto {
  final String? previewUrl;
  final String? imageUrl;
  final String? tags;

  const ImageDto({this.previewUrl, this.imageUrl, this.tags});

  @override
  String toString() =>
      'ImageDto{ previewUrl: $previewUrl, imageUrl: $imageUrl, tags: $tags}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageDto &&
          runtimeType == other.runtimeType &&
          previewUrl == other.previewUrl &&
          imageUrl == other.imageUrl &&
          tags == other.tags);

  @override
  int get hashCode => previewUrl.hashCode ^ imageUrl.hashCode ^ tags.hashCode;

  ImageDto copyWith({String? previewUrl, String? imageUrl, String? tags}) =>
      ImageDto(
        previewUrl: previewUrl ?? this.previewUrl,
        imageUrl: imageUrl ?? this.imageUrl,
        tags: tags ?? this.tags,
      );

  ImageDto.fromJson(Map<String, dynamic> json)
      : previewUrl = json['previewURL'],
        imageUrl = json['imageURL'],
        tags = json['tags'];

  Map<String, dynamic> toJson() =>
      {'previewURL': previewUrl, 'imageURL': imageUrl, 'tags': tags};
}
