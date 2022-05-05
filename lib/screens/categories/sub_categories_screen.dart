import 'package:daily_kart/base/color_resources.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/base/font_style.dart';
import 'package:daily_kart/providers/home_provider.dart';
import 'package:daily_kart/screens/categories/widgets/sub_categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubCategorieScreen extends StatelessWidget {
  final String id;
  const SubCategorieScreen({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadCategory = Provider.of<HomeProvider>(
      context,
      listen: false,
    ).categoryById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadCategory.categoryName),
      ),
      body: loadCategory.subCategories.isEmpty
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
                  child: Text("No SubCategories Found",
                      style: poppinsBold.copyWith(
                          fontSize: Dimensions.fontSizeLarge)),
                ),
              ],
            )
          : GridView.builder(
              itemCount: loadCategory.subCategories.length,
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1 / 1.3,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return SubCategoryWidget(
                 categorgyId:id,
                  product: loadCategory.subCategories[index],
                );
              },
            ),
    );
  }
}
