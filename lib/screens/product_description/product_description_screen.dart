import 'package:daily_kart/base/apis.dart';
import 'package:daily_kart/models/newarrival.dart';
import 'package:daily_kart/providers/cart_provider.dart';
import 'package:daily_kart/screens/home/widgets/catergory_view.dart';

import 'package:flutter/material.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/base/font_style.dart';
import 'package:provider/provider.dart';

import '../cart/cart_screen.dart';

class ProductDescriptionScreen extends StatefulWidget {
  final Newarrival product;
  ProductDescriptionScreen({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductDescriptionScreen> createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  bool _isloading = false;

  Future _addItem(context, userid, productId, productCategory, productPrice,
      mrp, productQty) async {
    setState(() {
      _isloading = true;
    });

    await Provider.of<CartProvider>(context, listen: false)
        .addToCart(
            userid, productId, productCategory, productPrice, mrp, productQty)
        .then((value) {
      setState(() {
        _isloading = false;
      });
      if (value = true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Add to Cart")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("oops something went wrong")));
      }
    });
  }

  // void _showBottom(BuildContext context) {
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
                    image: Api.imageUrl + widget.product.productImage,
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
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.product.productName,
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
                  widget.product.productPrice[0].sp.toString(),
                  style:
                      poppinsBold.copyWith(fontSize: Dimensions.fontSizeLarge),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Divider(),
            Text(
              widget.product.description,
              style:
                  poppinsMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              widget.product.varientType,
              style:
                  poppinsMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            _isloading == true
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
                    onPressed: () {

                      _addItem(
                          context,
                          7140,
                          widget.product.id,
                          widget.product.childCategoryName,
                          widget.product.productPrice[0].sp,
                          widget.product.productPrice[0].originalprice,
                          widget.product.productPrice[0].quantity);
                      // Scaffold.of(context).showBottomSheet((context) {
                      //   print("object");
                      //   return Container(
                      //     height: 300,
                      //     color: Colors.amber,
                      //   );
                      // });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const CartScreen()),
                      // );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Add To Cart"),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
