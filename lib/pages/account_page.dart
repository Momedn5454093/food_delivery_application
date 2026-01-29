import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/app_assets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget itemTappedTile(
    BuildContext context, {
    required String title,
    String? subtitle,
    required IconData icon,
  }) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Platform.isAndroid
        ? ListTile(
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle) : null,
          leading: Icon(
            icon,
            size: isLandscape ? size.height * 0.06 : size.height * 0.04,
          ),
          trailing: Icon(
            Icons.chevron_right,
            size: isLandscape ? size.height * 0.06 : size.height * 0.04,
          ),
          onTap: () {
            debugPrint("clicked");
          },
        )
        : CupertinoListTile(
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle) : null,
          leading: Icon(
            icon,
            size: isLandscape ? size.height * 0.06 : size.height * 0.04,
          ),
          trailing: Icon(
            Icons.chevron_right,
            size: isLandscape ? size.height * 0.06 : size.height * 0.04,
          ),
          onTap: () {
            debugPrint("clicked");
          },
        );
  }

  Widget personPhoto(double width, double height) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AppAssets.personPhoto),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget orderVoucherItem(
    BuildContext context, {
    required String title,
    required int count,
  }) {
    return Column(
      children: [
        Text(
          "$count ",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(title, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final nameText = Text(
      "Momen Mohamed",
      style: Theme.of(
        context,
      ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          if (!isLandscape) ...[
            personPhoto(size.width * 0.5, size.height * 0.15),

            SizedBox(height: size.height * 0.01),
            nameText,
            SizedBox(height: size.height * 0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                orderVoucherItem(context, title: "Orders", count: 50),
                orderVoucherItem(context, title: "Vouchers", count: 10),
              ],
            ),

            SizedBox(height: size.height * 0.03),
          ],
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    personPhoto(size.width * 0.5, size.height * 0.6),
                    SizedBox(height: size.height * 0.01),
                    nameText,
                    SizedBox(height: size.height * 0.02),
                  ],
                ),
                Column(
                  children: [
                    orderVoucherItem(context, title: "Orders", count: 50),
                    SizedBox(height: size.height * 0.02),
                    orderVoucherItem(context, title: "Vouchers", count: 10),
                  ],
                ),
              ],
            ),
          Divider(),
          itemTappedTile(
            context,
            title: "Past Orders",
            icon: Icons.shopping_cart,
          ),
          Divider(),
          itemTappedTile(
            context,
            title: "Available Vouchers",
            icon: Icons.card_giftcard,
          ),
          Divider(),
        ],
      ),
    );
  }
}
