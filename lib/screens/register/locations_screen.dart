import 'package:daily_kart/base/apis.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/providers/location.dart';
import 'package:daily_kart/screens/register/user_registration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatefulWidget {
  final String mobile;
  final String userId;

  const LocationScreen({required this.mobile, required this.userId, Key? key})
      : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  bool _isInit = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      data = await Provider.of<Location>(context, listen: false)
          .fetchAndSetProducts()
          .then((value) {
        setState(() {
          _isLoading = false;
        });
        return value;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  _register(BuildContext context, areaid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserRegistration(
            mobile: widget.mobile, userId: widget.userId, areaId: areaid),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Please Select Location",
            style: TextStyle(
                fontSize: Dimensions.fontSizeLarge,
                fontWeight: FontWeight.bold),
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: data[1].length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => _register(context, data[1][index].id),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Image.network(
                                  Api.imageUrl + data[1][index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(data[1][index].location),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    ));
  }
}
