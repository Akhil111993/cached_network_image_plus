import 'dart:core';
import 'dart:io';

import 'package:cached_network_image_plus/image_request.dart';
import 'package:flutter/material.dart';

import 'image_provider.dart' as image;

class CachedNetworkImagePlus extends StatefulWidget {
  final String url;
  final Widget? imageErrorWidget;
  final Widget? loadingWidget;
  final Color? progressBarColor;
  final double scale;
  final Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final double? width;
  final double? height;
  final Color? color;
  final Animation<double>? opacity;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;
  final Rect? centerSlice;
  final bool matchTextDirection;
  final bool gaplessPlayback;
  final bool isAntiAlias;
  final FilterQuality filterQuality;
  final int? cacheWidth;
  final int? cacheHeight;
  const CachedNetworkImagePlus(
      {Key? key,
      required this.url,
      this.imageErrorWidget = const Icon(Icons.image_not_supported_rounded),
      this.loadingWidget = const CircularProgressIndicator(),
      this.progressBarColor,
      this.color,
      this.width,
      this.height,
      this.alignment = Alignment.center,
      this.cacheHeight,
      this.cacheWidth,
      this.centerSlice,
      this.colorBlendMode,
      this.errorBuilder,
      this.excludeFromSemantics = false,
      this.filterQuality = FilterQuality.low,
      this.fit,
      this.frameBuilder,
      this.gaplessPlayback = false,
      this.isAntiAlias = false,
      this.matchTextDirection = false,
      this.opacity,
      this.repeat = ImageRepeat.noRepeat,
      this.scale = 1.0,
      this.semanticLabel})
      : super(key: key);

  @override
  State<CachedNetworkImagePlus> createState() => _CachedNetworkImagePlusState();
}

class _CachedNetworkImagePlusState extends State<CachedNetworkImagePlus> {
  double opacity = 0;
  @override
  Widget build(BuildContext context) {
    return !image.ImageProvider().imageMap.keys.contains(widget.url)
        ? FutureBuilder(
            future: ImageRequest().download(widget.url),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                opacity = 1.0;
                return getImageWidget(snapshot.data as String);
              } else if (snapshot.hasError) {
                return SizedBox(
                  width: widget.width,
                  height: widget.height,
                  child: Center(
                    child: widget.imageErrorWidget,
                  ),
                );
              } else {
                return SizedBox(
                  width: widget.width,
                  height: widget.height,
                  child: Center(
                    child: widget.progressBarColor == null
                        ? widget.loadingWidget
                        : CircularProgressIndicator(
                            color: widget.progressBarColor,
                          ),
                  ),
                );
              }
            },
          )
        : () {
            opacity = 1.0;
            return getImageWidget(
                image.ImageProvider().imageMap[widget.url] as String);
          }();
  }

  Widget getImageWidget(String path) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 2),
      opacity: opacity,
      child: Image.file(
        File(path),
        frameBuilder: widget.frameBuilder,
        errorBuilder: widget.errorBuilder,
        semanticLabel: widget.semanticLabel,
        excludeFromSemantics: widget.excludeFromSemantics,
        width: widget.width,
        height: widget.height,
        color: widget.color,
        opacity: widget.opacity,
        colorBlendMode: widget.colorBlendMode,
        fit: widget.fit,
        alignment: widget.alignment,
        repeat: widget.repeat,
        centerSlice: widget.centerSlice,
        matchTextDirection: widget.matchTextDirection,
        gaplessPlayback: widget.gaplessPlayback,
        isAntiAlias: widget.isAntiAlias,
        filterQuality: widget.filterQuality,
        cacheWidth: widget.cacheWidth,
        cacheHeight: widget.cacheHeight,
      ),
    );
  }
}
