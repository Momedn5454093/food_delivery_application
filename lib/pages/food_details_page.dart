import 'package:flutter/material.dart';

import '../models/food_item.dart';
import '../ui_model/food_details_arg.dart';
import '../widgets/customBackButton.dart';
import '../widgets/favorite_button.dart';
import '../widgets/food_details/food_item_counter.dart';
import '../widgets/food_details/property_item.dart';


class FoodDetailsPage extends StatelessWidget {

  const FoodDetailsPage({super.key, });

  static const String routeName = "/food_details";


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     final FoodDetailsArg foodArgs =ModalRoute.of(context)!.settings.arguments as FoodDetailsArg;
     final foodIndex = foodArgs.foodIndex;
    // final foodArgs =
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: CustomScrollView(slivers: [SliverAppBar(pinned: true,leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomBackButton(
                      height: size.height * 0.09,
                        width: size.height * 0.04, onTap: () => Navigator.of(context).pop(food[foodIndex].name),
                      ),
            ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FavoriteButton(
                  foodIndex: foodIndex,
                  height: size.height * 0.09,
                  width: size.height * 0.04,
                                ),
                ),],
              expandedHeight: size.height * 0.5,flexibleSpace: FlexibleSpaceBar(background: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.015)),
                child: Padding(
                  padding: const EdgeInsets.symmetric( vertical: 24.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.network(
                    food[foodArgs.foodIndex].imageUrl,
                    fit: BoxFit.cover,
                    height: size.height * 0.4,
                    width: size.width,
                                ),
                  ),
                ),
              ),),),

              SliverPadding(
                padding:const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,

              bottom: 46.0,
            ),
                sliver: SliverList(delegate: SliverChildListDelegate(
                    [
                      Row(

                  children: [
                    Column(
                      children: [
                        Text(
                          food[foodIndex].name,
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6.0),
                        Text(
                          "Buffelo Burger",
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(color: Colors.grey[600]),
                        ),
                      ],
                    ),

                    FoodItemCounter(),
                  ],
                ),
                const SizedBox(height: 32.0),
                const IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PropertyItem(
                        propertyName: "Size",
                        propertyValue: "Medium",
                      ),

                      VerticalDivider(
                        thickness: 1.0,
                        indent: 0.0,
                        endIndent: 0.0,
                      ),

                      PropertyItem(
                        propertyName: "cooking",
                        propertyValue: "10 - 15 min ",
                      ),
                      PropertyItem(
                        propertyName: "calories",
                        propertyValue: " 250 kcal ",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 32.0),])

              ))],)),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         TopBanner(foodIndex: foodIndex),
            //         Padding(
            //           padding: const EdgeInsets.only(
            //             left: 16.0,
            //             right: 16.0,
            //             top: 16.0,
            //             bottom: 46.0,
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Row(
            //                 children: [
            //                   Column(
            //                     children: [
            //                       Text(
            //                         food[foodIndex].name,
            //                         style: Theme.of(context).textTheme.headlineSmall!
            //                             .copyWith(fontWeight: FontWeight.w600),
            //                       ),
            //                       const SizedBox(height: 6.0),
            //                       Text(
            //                         "Buffelo Burger",
            //                         style: Theme.of(context).textTheme.bodyLarge!
            //                             .copyWith(color: Colors.grey[600]),
            //                       ),
            //                     ],
            //                   ),
            //
            //                   FoodItemCounter(),
            //                 ],
            //               ),
            //               const SizedBox(height: 32.0),
            //               IntrinsicHeight(
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     PropertyItem(
            //                       propertyName: "Size",
            //                       propertyValue: "Medium",
            //                     ),
            //
            //                     VerticalDivider(
            //                       thickness: 1.0,
            //                       indent: 0.0,
            //                       endIndent: 0.0,
            //                     ),
            //
            //                     PropertyItem(
            //                       propertyName: "cooking",
            //                       propertyValue: "10 - 15 min ",
            //                     ),
            //                     PropertyItem(
            //                       propertyName: "calories",
            //                       propertyValue: " 250 kcal ",
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(height: 15.0),
            //               Text(
            //                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the",
            //                 style: Theme.of(
            //                   context,
            //                 ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
            //               ),
            //               const SizedBox(height: 32.0),
            //
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Padding(

              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0  ),
              child: Row(
                children: [
                  Text(
                    "\$ ${food[foodIndex].price}",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 46.0),
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.05,

                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("chekout"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
