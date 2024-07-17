import 'package:blue_challenge/src/core/design_system/colors/ds_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RemoteImage extends StatelessWidget {
  final String url;
  final double height;
  final double? width;
  final BoxFit? fit;
  final BorderRadiusGeometry borderRadius;
  final Color progressColor;

  const RemoteImage({
    required this.url,
    required this.height,
    this.width,
    this.fit,
    this.borderRadius = BorderRadius.zero,
    this.progressColor = DSColors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: url,
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) => SizedBox(
          height: height,
          width: width,
          child: Center(
            child: CircularProgressIndicator(
              color: progressColor,
            ),
          ),
        ),
        errorWidget: (context, url, error) => SizedBox(
          height: height,
          width: width,
          child: Icon(
            Icons.image_not_supported,
            color: DSColors.black.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
