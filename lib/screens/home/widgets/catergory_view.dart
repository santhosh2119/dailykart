import 'package:daily_kart/base/apis.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/providers/home_provider.dart';
import 'package:daily_kart/screens/categories/sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daily_kart/base/font_style.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Consumer<HomeProvider>(
          builder: (context, data, child) => data.categoryList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: data.categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubCategorieScreen(
                                  id: data.categoryList[index].id)),
                        );
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8.0),
                            child: CircleAvatar(
                              radius: 40.0,
                              child: ClipRRect(
                                child: Image.network(
                                  Api.imageUrl + data.categoryList[index].image,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    "assets/images/logo_bw.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: 100,
                              child: Center(
                                child: Text(
                                  data.categoryList[index].categoryName,
                                  style: poppinsBold.copyWith(
                                      fontSize: Dimensions.fontSizeDefault),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );

                    // child: ListTile(
                  },
                ),
        ),
      ),
    );
  }
}
