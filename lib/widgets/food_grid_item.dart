import 'package:flutter/material.dart';


import '../models/food_item.dart';
import 'favorite_button.dart';

class FoodGridItem extends StatelessWidget {
  final int foodIndex;
  const FoodGridItem({super.key, required this.foodIndex});

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder:
              (context, constrains) => Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.network(
                        food[foodIndex].imageUrl,
                        height:
                            isLandScape
                                ? constrains.maxHeight * 0.7
                                : constrains.maxHeight * 0.5,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: FavoriteButton(
                          foodIndex: foodIndex,
                          height: constrains.maxHeight * 0.1,
                          width: constrains.maxHeight * 0.1,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: constrains.maxHeight * 0.02),
                  FittedBox(
                    child: Text(
                      food[foodIndex].name,
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall!.copyWith(fontFamily: 'OpenSans'),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),

                  SizedBox(
                    height: constrains.maxHeight * 0.05,
                    child: FittedBox(
                      child: Text(
                        "\$${food[foodIndex].price}",
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
