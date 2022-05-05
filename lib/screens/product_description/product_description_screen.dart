import 'package:daily_kart/base/apis.dart';
import 'package:daily_kart/models/newarrival.dart';
import 'package:daily_kart/screens/home/widgets/catergory_view.dart';

import 'package:flutter/material.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/base/font_style.dart';

import '../cart/cart_screen.dart';

class ProductDescriptionScreen extends StatelessWidget {
  final Newarrival product;
  const ProductDescriptionScreen({required this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Center(
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/logo_bw.png",
                    image: Api.imageUrl + product.productImage,
                    imageErrorBuilder: (context, error, stackTrace) => Center(
                      child: Image.asset(
                        "assets/images/logo_bw.png",
                        height: 1,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.95,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              product.productName,
              style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeLarge),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  '\u{20B9}',
                  style:
                      poppinsBold.copyWith(fontSize: Dimensions.fontSizeLarge),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.productPrice[0].sp.toString(),
                  style:
                      poppinsBold.copyWith(fontSize: Dimensions.fontSizeLarge),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Divider(),
            Text(
              product.description,
              style:
                  poppinsMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              product.varientType,
              style:
                  poppinsMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Add To Cart"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
