import 'package:daily_kart/base/color_resources.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/base/font_style.dart';
import 'package:daily_kart/providers/home_provider.dart';
import 'package:daily_kart/screens/subcategories/widgets/child_category_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChildSubCategoryScreen extends StatelessWidget {
  final String title;
  final String categoryId;
  final String subCategoryId;
  const ChildSubCategoryScreen(
      {required this.title,
      required this.categoryId,
      required this.subCategoryId,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadedChildCategory =
        Provider.of<HomeProvider>(context, listen: false)
            .childCategory(categoryId, subCategoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: loadedChildCategory.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Icon(
                    Icons.mood_bad,
                    color: ColorResources.getPrimary,
                    size: 80.0,
                  ),
                ),
                Center(
                  child: Text("No ChildCategories Found",
                      style: poppinsBold.copyWith(
                          fontSize: Dimensions.fontSizeLarge)),
                ),
              ],
            )
          : GridView.builder(
              itemCount: loadedChildCategory.length,
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1 / 1.3,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return ChildCategoryWidget(
                  catId: categoryId,
                  subCatId: subCategoryId,
                  product: loadedChildCategory[index],
                );
              },
            ),
    );
  }
}
