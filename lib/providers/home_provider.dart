import 'dart:convert';

import 'package:daily_kart/base/apis.dart';
import 'package:daily_kart/models/banners_home.dart';
import 'package:daily_kart/models/home_banners.dart';
import 'package:daily_kart/models/newarrival.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:daily_kart/models/categories.dart';
import 'package:daily_kart/models/recentlyviewed.dart';

class HomeProvider with ChangeNotifier {
  final List<BannersHome> _bannersHome = [];
  final List bannerimg = [];
  List<BannersHome> get bannersHome => _bannersHome;

  final List<Categories> _categoryList = [];
  List<Categories> get categoryList => _categoryList;

  final List<HomeBanners> _homeBanner = [];
  List<HomeBanners> get homeBanners => _homeBanner;

  final List<Newarrival> _newarrival = [];
  List<Newarrival> get newarrivalList => _newarrival;

  final List<Recentlyviewed> _recentviewed = [];
  List<Recentlyviewed> get recentViewed => _recentviewed;

  Future getHome(BuildContext context, bool reload, String userid) async {
    final url = Uri.parse(Api.home);
    try {
      final response = await http.post(url, body: {"userid": userid});

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      for (int i = 0; i < extractedData['new_arrivals'].length; i++) {
        _newarrival.add(Newarrival.fromJson(extractedData['new_arrivals'][i]));
      }

      for (int i = 0; i < extractedData['categories'].length; i++) {
        _categoryList.add(Categories.fromJson(extractedData['categories'][i]));
      }
      for (int i = 0; i < extractedData['recently_viewed'].length; i++) {
        _recentviewed
            .add(Recentlyviewed.fromJson(extractedData['recently_viewed'][i]));
      }
      for (int i = 0; i < extractedData['banners'].length; i++) {
        bannersHome.add(BannersHome.fromJson(extractedData['banners'][i]));
      }
      for (int i = 0; i < extractedData['banners'].length; i++) {
        // // extractedData['banners'][i]["images"]

        homeBanners.add(HomeBanners.fromJson(extractedData['banners'][i]));
        homeBanners.map((e) {
          bannerimg.add(e.images);
          return bannerimg;
        }).toList();
      }

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Categories categoryById(String id) {
    return _categoryList.firstWhere((prod) => prod.id == id);
  }

  childCategory(String id, String ind) {
    var sub = _categoryList.firstWhere((prod) => prod.id == id).subCategories;
    var subcat = sub.firstWhere((e) => e['sub_cat_id'] == ind);
    var child = subcat['child_categories'];
    return child;
  }

  childChatergoryProducts(
    String catId,
    String subCatId,
  ) {
    var sub =
        _categoryList.firstWhere((prod) => prod.id == catId).subCategories;
    var subCat = sub.firstWhere((e) => e["sub_cat_id"] == subCatId);
    var childCat = subCat["child_categories"];

    // var products = childCat[childCatId];

    return childCat;
  }

  search(String product) {
    print(product);
    var searchdata = _newarrival.contains(product);
    print(searchdata);
    return searchdata;
  }
}
