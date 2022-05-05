import 'package:daily_kart/base/apis.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/base/font_style.dart';
import 'package:daily_kart/screens/subcategories/sub_category_screen.dart';
import 'package:flutter/material.dart';

class SubCategoryWidget extends StatelessWidget {
  final String categorgyId;
  final dynamic product;

  const SubCategoryWidget(
      {required this.categorgyId, required this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChildSubCategoryScreen(
                      title: product["sub_category_name"],
                      categoryId: categorgyId,
                      subCategoryId: product["sub_cat_id"],
                    )),
          );

          // Navigator.of(context).pushNamed(Routes.getProductDetailsRoute(offerProduct.offerProductList[index].id),
          //     arguments: ProductDetailsScreen(product: offerProduct.offerProductList[index]));
        },
        child: Container(
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
                image: Api.imageUrl + product["image"],
                imageErrorBuilder: (context, error, stackTrace) => Center(
                  child: Image.asset(
                    "assets/images/logo_bw.png",
                    width: 50,
                    height: 60,
                  ),
                ),
                height: 180,
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
                        product["sub_category_name"],
                        style: poppinsBold.copyWith(
                            fontSize: Dimensions.fontSizeSmall),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                      // // RatingBar(
                      // //   rating: offerProduct.offerProductList[index].rating.length > 0 ? double.parse(offerProduct.offerProductList[index].rating[0].average) : 0.0,
                      // //   size: 12,
                      // // ),
                      // const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
