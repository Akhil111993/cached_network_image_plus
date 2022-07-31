import 'dart:io';

import 'package:flutter/material.dart';

import 'image_provider.dart' as image;
import 'image_request.dart';

class CachedNetworkImagePlusNetworkProvider {
  ImageProvider<Object> getImageProvider(String url) {
    if (image.ImageProvider.imageMap.keys.contains(url)) {
      return FileImage(
        File(image.ImageProvider.imageMap[url] as String),
      );
    } else {
      ImageRequest().download(url);
      return NetworkImage(url);
    }
  }
}
