import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_kart/screens/product_description/product_description_screen.dart';
import 'package:flutter/material.dart';

import '../../../base/apis.dart';
import '../../../base/dimension.dart';
import '../../../base/font_style.dart';
import '../../../models/newarrival.dart';

class TestProduct extends StatelessWidget {
  final Newarrival product;
  const TestProduct({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double t = MediaQuery.of(context).size.width;
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
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black.withAlpha(100)),
              borderRadius: new BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(40),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 2), // changes position of shadow
                ),
              ]),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Hero(
                            tag: product.id,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.7 -
                                          20,
                                  child: cacheImageWidgetCover(
                                      Api.imageUrl + product.productImage,
                                      Colors.green)),
                            )),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              // widget.onAddToCartClick(widget.product.id);
                            },
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.green.withAlpha(220),
                                border: Border.all(color: Colors.green),
                                borderRadius: new BorderRadius.only(
                                    topLeft: Radius.circular(30)),
                              ),
                              child: UnconstrainedBox(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                    "assets/images/addtocart.png",
                                    fit: BoxFit.contain,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        saleSticker(
                          t /= 2,
                          product.productPrice[0].discountPercentage,
                          product.productPrice[0].sp,
                          product.productPrice[0].originalprice,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            product.productName,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: poppinsBold.copyWith(
                                fontSize: Dimensions.fontSizeDefault),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                product.productName,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: poppinsBold.copyWith(
                                    fontSize: Dimensions.fontSizeLarge),
                              )),
                              Text(
                                product.productPrice[0].sp,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.end,
                                style: poppinsBold.copyWith(
                                    fontSize: Dimensions.fontSizeLarge),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cacheImageWidgetCover(String image, Color color) {
  return Container(
    child: CachedNetworkImage(
      placeholder: (context, url) => UnconstrainedBox(
          child: Container(
        alignment: Alignment.center,
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          backgroundColor: color,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          strokeWidth: 1,
        ),
      )),
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.contain,
          ),
        ),
      ),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    ),
  );
}

Widget saleSticker(
    double width, int discount, String offer, String discountprice) {
  var size = 180 * 0.3;
  var margin = size * 0.05;
  var radius = 5.0;
  var _boxshadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      spreadRadius: 2,
      blurRadius: 2,
      offset: Offset(3, 3),
    ),
  ];
  return Container(
    margin: EdgeInsets.only(left: 10, top: 10, right: 10),
    // height: size,
    width: size,
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: margin, right: margin),
          height: size * 0.25,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            boxShadow: _boxshadow,
          ),
          child: Center(
              child: Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: FittedBox(
                      child: Text(
                    "-" + discount.toString() + "%",
                    style: poppinsBold.copyWith(
                        fontSize: Dimensions.fontSizeLarge),
                  )))),
        ),
        Container(
          height: size * 0.5,
          width: size,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: _boxshadow,
          ),
          child: Center(
              child: Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: FittedBox(
                      child: Text(
                    offer.toString(),
                    style: poppinsBold.copyWith(
                        fontSize: Dimensions.fontSizeLarge),
                  )))),
        ),
        Container(
          margin: EdgeInsets.only(left: margin, right: margin),
          height: size * 0.25,
          width: size,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: _boxshadow,
          ),
          child: Center(
            child: Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              child: FittedBox(
                child: Text(
                  discountprice,
                  style: poppinsBold
                      .copyWith(fontSize: Dimensions.fontSizeLarge)
                      .copyWith(decoration: TextDecoration.lineThrough),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
