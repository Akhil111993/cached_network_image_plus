class ImageProvider {
  static final imageMap = <String, String>{};
  // static final imageProvider = ImageProvider._internal();
  //
  // factory ImageProvider() => imageProvider;

  // ImageProvider._internal();

  static void addImage(String url, String path) {
    imageMap.putIfAbsent(url, () => path);
  }
}
