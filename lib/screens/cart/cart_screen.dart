import 'package:daily_kart/base/dimension.dart';
import 'package:flutter/material.dart';

import '../../base/font_style.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.paddingSizeDefault,
              right: Dimensions.paddingSizeDefault,
              left: Dimensions.paddingSizeDefault),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.76,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.26,
                                child: Image.asset("assets/images/logo_bw.png",
                                    fit: BoxFit.contain),
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "product Name",
                                      style: poppinsBold.copyWith(
                                          fontSize: Dimensions.fontSizeLarge),
                                    ),
                                    Text(
                                      "data",
                                      style: poppinsBold.copyWith(
                                          fontSize: Dimensions.fontSizeLarge),
                                    ),
                                    Text(
                                      "data",
                                      style: poppinsBold.copyWith(
                                          fontSize: Dimensions.fontSizeLarge),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Place Order"))
            ],
          ),
        ),
      ),
    );
  }
}
