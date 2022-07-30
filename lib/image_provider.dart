class ImageProvider {
  final imageMap = <String, String>{};
  static final imageProvider = ImageProvider._internal();

  factory ImageProvider() => imageProvider;

  ImageProvider._internal();

  void addImage(String url, String path) {
    imageMap.putIfAbsent(url, () => path);
  }
}
