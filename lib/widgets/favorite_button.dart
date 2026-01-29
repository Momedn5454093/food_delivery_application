import 'package:flutter/material.dart';

import '../models/food_item.dart';
import 'custom_secondary_button.dart';

class FavoriteButton extends StatefulWidget {
  final int foodIndex;
  final double height;
  final double width;

  const FavoriteButton({
    super.key,
    required this.foodIndex,
    required this.height,
    required this.width,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return CustomSecondaryButton(
      height: widget.height,
      width: widget.width,
      iconData:
          food[widget.foodIndex].isFavorite
              ? Icons.favorite
              : Icons.favorite_border,
      onTap:
          () => setState(() {
            food[widget.foodIndex] = food[widget.foodIndex].copyWith(
              isFavorite: !food[widget.foodIndex].isFavorite,
            );
          }),
    );
  }
}
