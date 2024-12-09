import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgAsset extends StatelessWidget {
  final String assetName;
  final Color? color;
  final double? height, width;
  const SvgAsset(
    this.assetName, {
    super.key,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            ),
    );
  }
}

class SvgNework extends StatelessWidget {
  final String url;
  final Color? color;
  final double? height, width;
  const SvgNework(
    this.url, {
    super.key,
    this.color,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      url,
      height: height,
      width: width,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            ),
    );
  }
}
