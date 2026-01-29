import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/food_item.dart';
import '../ui_model/food_details_arg.dart';
import '../utilities/app_assets.dart';
import 'food_details_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Widget adaptiveFavButton(BuildContext context, VoidCallback onPressed) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final favoriteFood = food.where((item) => item.isFavorite == true).toList();

    if (Platform.isIOS) {
      return CupertinoButton(onPressed: onPressed, child: Text("favorite"));
    } else {
      return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(Icons.favorite),
        label: Text("favorite", style: Theme.of(context).textTheme.titleMedium),
      );
    }
  }

  Widget buildPortraitFavButton(
    List<FoodItem> favoriteFood,
    int index,
    BoxConstraints constrains,
  ) {
    return IconButton(
      onPressed: () {
        final targetItem = favoriteFood[index];
        final originalIndex = food.indexOf(targetItem);
        setState(() {
          food[originalIndex] = food[originalIndex].copyWith(isFavorite: false);
          favoriteFood.remove(targetItem);
        });
      },
      icon: Icon(
        Icons.favorite,
        color: Theme.of(context).primaryColor,
        size: constrains.maxHeight * 0.09,
      ),
    );
  }

  Widget buildWhenEmptyState(bool isLandScape) {
    return LayoutBuilder(
      builder:
          (context, constrains) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  AppAssets.emptyState,
                  fit: BoxFit.contain,
                  width:
                      isLandScape
                          ? constrains.maxWidth * 0.8
                          : constrains.maxWidth * 0.3,
                  height:
                      isLandScape
                          ? constrains.maxHeight * 0.9
                          : constrains.maxHeight * 0.4,
                ),
              ),

              SizedBox(height: constrains.maxHeight * 0.02),
              Text(
                "No Favorites Item Found",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final favoriteFood = food.where((item) => item.isFavorite == true).toList();

    if (favoriteFood.isEmpty) {
      return buildWhenEmptyState(isLandScape);
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder:
            (context, constrains) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: favoriteFood.length,
                    itemBuilder:
                        (BuildContext context, int index) => InkWell(
                          onTap: () {
                            int targetIndex = food.indexOf(
                              favoriteFood[index],
                            );
                            Navigator.of(context).pushNamed(
                                 " ${FoodDetailsPage.routeName}",
                              arguments: FoodDetailsArg(foodIndex: targetIndex),
                            ).then((value) {
                              setState(() {});

                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    favoriteFood[index].imageUrl,
                                    height:
                                        isLandScape
                                            ? constrains.maxHeight * 0.5
                                            : constrains.maxHeight * 0.3,
                                    width:
                                        isLandScape
                                            ? constrains.maxWidth * 0.4
                                            : constrains.maxWidth * 0.2,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: constrains.maxHeight * 0.02),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          favoriteFood[index].name,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium!.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: constrains.maxHeight * 0.01,
                                        ),
                                        Text(
                                          "\$ ${favoriteFood[index].price}",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium!.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (!isLandScape)
                                    buildPortraitFavButton(
                                      favoriteFood,
                                      index,
                                      constrains,
                                    ),
                                  if (isLandScape)
                                    adaptiveFavButton(context, () {
                                      final targetItem = favoriteFood[index];
                                      final originalIndex = food.indexOf(
                                        targetItem,
                                      );
                                      setState(() {
                                        food[originalIndex] =
                                            food[originalIndex].copyWith(
                                              isFavorite: false,
                                            );
                                        favoriteFood.remove(targetItem);
                                      });
                                    }),
                                ],
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
