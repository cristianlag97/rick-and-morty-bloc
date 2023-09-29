import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/core.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: colorShimmer,
      highlightColor: colorGreyLight,
      child: widget.child,
    );
  }
}
