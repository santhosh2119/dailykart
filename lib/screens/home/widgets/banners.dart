import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_kart/base/apis.dart';
import 'package:daily_kart/models/home_banners.dart';
import 'package:flutter/material.dart';

import '../../../models/banners_home.dart';

class Newbanner extends StatefulWidget {
  final List<dynamic> imgList;
  const Newbanner({required this.imgList, Key? key}) : super(key: key);

  @override
  State<Newbanner> createState() => _NewbannerState();
}

class _NewbannerState extends State<Newbanner> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.imgList.length,
        itemBuilder: (context, i) {
          return Container(
            height: 500,
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.95,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      child: CachedNetworkImage(
                        placeholder: (context, url) => UnconstrainedBox(
                            child: Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(),
                        )),
                        imageUrl: Api.imageUrl + widget.imgList[i].images,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
