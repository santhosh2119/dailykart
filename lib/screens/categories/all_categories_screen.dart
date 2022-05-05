import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/providers/home_provider.dart';
import 'package:daily_kart/screens/categories/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoustomCategories extends StatelessWidget {
  const CoustomCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Categories"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: Consumer<HomeProvider>(
                builder: (context, data, child) => data.categoryList.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    :  GridView.builder(
                        itemCount: data.categoryList.length,
                        padding:
                            const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1 / 1.3,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                              product: data.categoryList[index]);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
