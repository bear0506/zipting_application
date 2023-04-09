import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:zipting/app/core/values/colors.dart';

class LikeButtonWidget extends StatefulWidget {
  @override
  _LikeButtonWidgetState createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    final double size = 30;
    return LikeButton(
      size: size,
      isLiked: isLiked,
      likeBuilder: (isLiked) {
        final color = isLiked ? kPrimaryColor : Colors.white;
        return Icon(Icons.favorite, color: color, size: size);
      },
    );
  }
}
