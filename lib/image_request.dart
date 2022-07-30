import 'dart:io';

import 'package:cached_network_image_plus/image_provider.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImageRequest {
  Future<String> download(String url) async {
    final response = await http.get(Uri.parse(url));
    // Get the image name
    final imageName = path.basename(url);
    // Get the document directory path
    final appDir = await getTemporaryDirectory();

    // This is the saved image path
    final localPath = path.join(appDir.path, imageName);

    // Downloading
    final imageFile = File(localPath);
    await imageFile.writeAsBytes(response.bodyBytes);

    ImageProvider().addImage(url, localPath);
    return localPath;
  }
}
