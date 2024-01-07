import 'package:flutter/material.dart';

@immutable
class ImageDto {
  final String? previewUrl;
  final String? imageUrl;
  final String? webFormatUrl;
  final String? largeImageUrl;
  final String? fullHdUrl;
  final String? tags;

  const ImageDto({
    this.previewUrl,
    this.imageUrl,
    this.webFormatUrl,
    this.largeImageUrl,
    this.fullHdUrl,
    this.tags,
  });

  ImageDto.fromJson(Map<String, dynamic> json)
      : previewUrl = json['previewURL'],
        imageUrl = json['imageURL'],
        webFormatUrl = json['webformatURL'],
        largeImageUrl = json['largeImageURL'],
        fullHdUrl = json['fullHDURL'],
        tags = json['tags'];

  Map<String, dynamic> toJson() => {
        'previewURL': previewUrl,
        'imageURL': imageUrl,
        'webformatURL': webFormatUrl,
        'largeImageURL': largeImageUrl,
        'fullHDURL': fullHdUrl,
        'tags': tags
      };

  @override
  String toString() =>
      'ImageDto{ previewUrl: $previewUrl, imageUrl: $imageUrl, webFormatUrl: $webFormatUrl, largeImageUrl: $largeImageUrl, fullHdUrl: $fullHdUrl, tags: $tags }';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageDto &&
          runtimeType == other.runtimeType &&
          previewUrl == other.previewUrl &&
          imageUrl == other.imageUrl &&
          webFormatUrl == other.webFormatUrl &&
          largeImageUrl == other.largeImageUrl &&
          fullHdUrl == other.fullHdUrl &&
          tags == other.tags);

  @override
  int get hashCode =>
      previewUrl.hashCode ^
      imageUrl.hashCode ^
      webFormatUrl.hashCode ^
      largeImageUrl.hashCode ^
      fullHdUrl.hashCode ^
      tags.hashCode;

  ImageDto copyWith({
    String? previewUrl,
    String? imageUrl,
    String? webFormatUrl,
    String? largeImageUrl,
    String? fullHdUrl,
    String? tags,
  }) =>
      ImageDto(
        previewUrl: previewUrl ?? this.previewUrl,
        imageUrl: imageUrl ?? this.imageUrl,
        webFormatUrl: webFormatUrl ?? this.webFormatUrl,
        largeImageUrl: largeImageUrl ?? this.largeImageUrl,
        fullHdUrl: fullHdUrl ?? this.fullHdUrl,
        tags: tags ?? this.tags,
      );
}
