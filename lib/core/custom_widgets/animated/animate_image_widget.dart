import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postify/core/custom_widgets/custom_image/custom_network_image.dart';

enum ImageType {
  svg,
  png,
  network,
}

class AnimatedImageWidget extends StatefulWidget {
  const AnimatedImageWidget({
    super.key,
    required this.image,
    this.height,
    required this.imageType,
    this.color,
  });

  final String image;
  final ImageType imageType;
  final double? height;
  final Color? color;

  @override
  State<AnimatedImageWidget> createState() => _AnimatedImageWidgetState();
}

class _AnimatedImageWidgetState extends State<AnimatedImageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildImage() {
    switch (widget.imageType) {
      case ImageType.svg:
        return SvgPicture.asset(widget.image,
            height: widget.height,
            colorFilter: widget.color != null
                ? ColorFilter.mode(widget.color!, BlendMode.srcIn)
                : null);
      case ImageType.png:
        return Image.asset(widget.image, height: widget.height);
      case ImageType.network:
        return CustomNetworkImage(
            imageUrl: widget.image, height: widget.height);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: _buildImage(),
    );
  }
}
