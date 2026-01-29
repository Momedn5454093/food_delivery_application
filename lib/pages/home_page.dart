import 'package:flutter/material.dart';


import '../models/food_item.dart';
import '../ui_model/food_details_arg.dart';
import '../utilities/app_assets.dart';
import '../widgets/food_grid_item.dart';
import 'food_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _ = MediaQuery.of(context).textScaleFactor;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Image.asset(
                AppAssets.classicBurger,
                height: isLandscape ? size.height * 0.6 : size.height * 0.22,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            // if (Platform.isIOS)
            //   Text(
            //     "hello iOS User",
            //     style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            //       fontWeight: FontWeight.w600,
            //       fontSize: 22 * textScale,
            //     ),
            //   ),
            // if (Platform.isAndroid)
            //   Text(
            //     "hello Android User",
            //     style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            //       fontWeight: FontWeight.w600,
            //       fontSize: 22 * textScale,
            //     ),
            //   ),
            // if (Platform.isFuchsia) SizedBox(height: size.height * 0.03),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandscape ? 4 : 2,
                mainAxisSpacing: size.height * 0.02,
                crossAxisSpacing: size.height * 0.02,
              ),
              itemCount: food.length,
              itemBuilder:
                  (BuildContext context, int index) => InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(FoodDetailsPage.routeName,arguments: FoodDetailsArg(foodIndex: index))
                          .then((value) {
                            setState(() {});
                            debugPrint(value as String);
                          });
                    },
                    child: FoodGridItem(foodIndex: index),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
