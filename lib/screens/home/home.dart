import 'package:daily_kart/base/color_resources.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/base/font_style.dart';
import 'package:daily_kart/providers/home_provider.dart';
import 'package:daily_kart/screens/cart/cart_screen.dart';
import 'package:daily_kart/screens/categories/all_categories_screen.dart';
import 'package:daily_kart/screens/home/widgets/carousle.dart';
import 'package:daily_kart/screens/home/widgets/catergory_view.dart';
import 'package:daily_kart/screens/home/widgets/grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../drawer/drawer.dart';
import '../home/widgets/banners.dart';
import '../search/search_screen.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  Home({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> drawerGlobalKey = GlobalKey();
//
  Future<void> _loadData(BuildContext context, bool reload) async {
    await Provider.of<HomeProvider>(context, listen: false)
        .getHome(context, false, "7140");
  }

  @override
  Widget build(BuildContext context) {
    _loadData(context, false);

    return Scaffold(
      key: _scaffoldState,
      backgroundColor: ColorResources.getBackgroundColor,
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            children: <Widget>[
              Container(
                height: 30.0,
                color: Colors.white,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              const CoustomDrawer(title: 'Profile', icon: Icon(Icons.person)),
              const CoustomDrawer(
                  title: 'Cart', icon: Icon(Icons.shopping_cart)),
              const CoustomDrawer(
                  title: 'My Orders', icon: Icon(Icons.card_giftcard)),
              const CoustomDrawer(
                title: 'Offer',
                icon: Icon(Icons.local_offer),
              ),
              const Divider(),
              const CoustomDrawer(
                title: 'About Us',
                icon: Icon(Icons.info),
              ),
              const CoustomDrawer(title: 'Contact Us', icon: Icon(Icons.phone)),
              const CoustomDrawer(
                title: 'LogOut',
                icon: Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _scaffoldState.currentState?.openDrawer(),
          icon: const Icon(Icons.menu),
        ),
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height * 1,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                color: Theme.of(context).primaryColor,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextFormField(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()),
                        );
                      },
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.close),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.11,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list),
                      ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<HomeProvider>(builder: (context, data, child) {
                  return data.bannerimg.isNotEmpty
                      ? ImageSliderDemo(
                          imgList: data.bannerimg,
                        )
                      : data.categoryList.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : ImageSliderDemo(imgList: data.bannerimg);
                }),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                color: Theme.of(context).primaryColor,
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.category),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Shop By Category",
                      style: poppinsBold.copyWith(
                          fontSize: Dimensions.fontSizeDefault),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Consumer<HomeProvider>(builder: (context, data, child) {
                return data.categoryList.isNotEmpty
                    ? const CategoryScreen()
                    : data.categoryList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : const CategoryScreen();
              }),
              Container(
                padding: const EdgeInsets.all(6),
                color: Theme.of(context).primaryColor,
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.category),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "New Arrivals",
                      style: poppinsBold.copyWith(
                          fontSize: Dimensions.fontSizeDefault),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Consumer<HomeProvider>(builder: (context, data, child) {
                return data.newarrivalList.isNotEmpty
                    ? const CoustomGrid()
                    : data.newarrivalList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : const CoustomGrid();
              }),
              Container(
                padding: const EdgeInsets.all(6),
                color: Theme.of(context).primaryColor,
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.category),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Recently Viewed",
                      style: poppinsBold.copyWith(
                          fontSize: Dimensions.fontSizeDefault),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Consumer<HomeProvider>(builder: (context, data, child) {
                return data.recentViewed.isNotEmpty
                    ? const CoustomGrid()
                    : data.recentViewed.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : const CoustomGrid();
              }),
            ],
          ),
        ),
      ),

      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Consumer<HomeProvider>(builder: (context, data, child) {
      //           return data.bannerimg.isNotEmpty
      //               ? Newbanner(
      //                   imgList: data.bannerimg,
      //                 )
      //               : data.categoryList.isEmpty
      //                   ? const Center(child: CircularProgressIndicator())
      //                   : Newbanner(imgList: data.bannerimg);
      //         }),
      //         const SizedBox(
      //           height: Dimensions.paddingSizeDefault,
      //         ),
      //         // Row(
      //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         //   children: [
      //         //     Text("All Categories",
      //         //         style: poppinsBold.copyWith(
      //         //             fontSize: Dimensions.fontSizeLarge)),
      //         //     InkWell(
      //         //       onTap: () {
      //         //         Navigator.push(
      //         //           context,
      //         //           MaterialPageRoute(
      //         //               builder: (context) => const CoustomCategories()),
      //         //         );
      //         //       },
      //         //       child: Padding(
      //         //         padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
      //         //         child: Text('View All',
      //         //             style: poppinsBold.copyWith(
      //         //                 fontSize: Dimensions.fontSizeLarge,
      //         //                 color: ColorResources.getHintColor)),
      //         //       ),
      //         //     ),
      //         //   ],
      //         // ),
      //         // Consumer<HomeProvider>(builder: (context, data, child) {
      //         //   return data.categoryList.isNotEmpty
      //         //       ? const CategoryScreen()
      //         //       : data.categoryList.isEmpty
      //         //           ? const Center(child: CircularProgressIndicator())
      //         //           : const CategoryScreen();
      //         // }),
      //         // Text("New  Arrivals",
      //         //     style: poppinsBold.copyWith(
      //         //         fontSize: Dimensions.fontSizeLarge)),
      //         // Consumer<HomeProvider>(builder: (context, data, child) {
      //         //   return data.newarrivalList.isNotEmpty
      //         //       ? const CoustomGrid()
      //         //       : data.newarrivalList.isEmpty
      //         //           ? const Center(child: CircularProgressIndicator())
      //         //           : const CoustomGrid();
      //         // }),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
