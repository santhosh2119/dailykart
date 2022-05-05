import 'package:daily_kart/base/apis.dart';
import 'package:daily_kart/base/color_resources.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/base/font_style.dart';
import 'package:daily_kart/models/newarrival.dart';
import 'package:daily_kart/screens/product_description/product_description_screen.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Newarrival product;
  const ProductWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDescriptionScreen(
                      product: product,
                    )),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xffd3d3d3), blurRadius: 5, spreadRadius: 1)
              ]),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/logo_bw.png",
                image: Api.imageUrl + product.productImage,
                imageErrorBuilder: (context, error, stackTrace) => Center(
                  child: Image.asset(
                    "assets/images/logo_bw.png",
                    height: 120,
                  ),
                ),
                height: 110,
                width: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeSmall),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.productName,
                        style: poppinsBold.copyWith(
                            fontSize: Dimensions.fontSizeSmall),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                      // RatingBar(
                      //   rating: offerProduct.offerProductList[index].rating.length > 0 ? double.parse(offerProduct.offerProductList[index].rating[0].average) : 0.0,
                      //   size: 12,
                      // ),
                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\u{20B9}' + product.productPrice[0].sp,
                            style: poppinsBold.copyWith(
                                fontSize: Dimensions.fontSizeSmall),
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\u{20B9}' +
                                  product.productPrice[0].originalprice,
                              style: poppinsBold.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall,
                                color: ColorResources.getGrayColor,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const Icon(Icons.add, color: Colors.black),
                          ])
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
