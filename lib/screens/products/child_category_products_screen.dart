import 'package:flutter/material.dart';

class ChildCategoryProductsScreen extends StatelessWidget {
  final String title;
  final String catId;
  final String subCatId;
  final String childCatId;

  const ChildCategoryProductsScreen(
      {required this.title,
      required this.catId,
      required this.subCatId,
      required this.childCatId,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final loadedProducts = Provider.of<HomeProvider>(context, listen: false)
    //     .childChatergoryProducts(catId, subCatId, );
    // print(loadedProducts);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // body: Column(
      //   children: [Text(catId), Text(subCatId), Text(childCatId)],
      // ),
      body: ListView.builder(
        itemBuilder: (context, int index) {
          return SingleChildScrollView(
            child: InkWell(
              child: Card(
                  child: ListTile(
                leading: Image.network(''),
                title: Text(title),
                subtitle: Text(subCatId),
                trailing: Text(childCatId),
              )),
            ),
          );
        },
      ),
    );
  }
}
