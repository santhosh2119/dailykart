import 'package:daily_kart/providers/auth.dart';
import 'package:daily_kart/screens/home/home.dart';
import 'package:daily_kart/widgets/coustom_button.dart';
import 'package:daily_kart/widgets/coustom_input_text_field.dart';
import 'package:daily_kart/widgets/coustom_space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserRegistration extends StatefulWidget {
  final String mobile;
  final String userId;
  final String areaId;
  const UserRegistration(
      {required this.mobile,
      required this.userId,
      required this.areaId,
      Key? key})
      : super(key: key);
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _houseNo = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _landmark = TextEditingController();
  final TextEditingController _currentLocation = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _optional = TextEditingController();

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error Occured'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK!'),
          )
        ],
      ),
    );
  }

  bool _loading = false;
  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });
      try {
        final registerUser =
            await Provider.of<Auth>(context, listen: false).userData(
          _fullName.text.trim(),
          _email.text.trim(),
          widget.areaId,
          _street.text.trim(),
          "${_street.text.trim()},${_houseNo.text.trim()},${_landmark.text.trim()},${widget.areaId}",
          widget.areaId,
          widget.userId,
          _password.text.trim(),
          _optional.text,
          _houseNo.text.trim(),
          _landmark.text.trim(),
        );
        setState(() {
          _loading = false;
        });

        if (registerUser[1]["steps_completed"] == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        } else {
          _showErrorDialog(context, "Something Went Worng");
        }
      } catch (error) {
        rethrow;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CoustomSpace(),

                CoustomInputField(
                  controller: _fullName,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.length > 3) {
                      return null;
                    }
                    return "Please Enter valid FullName";
                  },
                  labelText: "Full Name",
                ),

                const CoustomSpace(),
                CoustomInputField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.contains('@')) {
                      return null;
                    }
                    return "Please Enter valid  Email";
                  },
                  labelText: "Email",
                ),
                const CoustomSpace(),

                CoustomInputField(
                  controller: _houseNo,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.length > 1) {
                      return null;
                    }
                    return "Please Enter valid  House No";
                  },
                  labelText: "House No",
                ),
                const CoustomSpace(),
                CoustomInputField(
                  controller: _street,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.length > 2) {
                      return null;
                    }
                    return "Please Enter valid  Street No";
                  },
                  labelText: "Street No",
                ),
                const CoustomSpace(),

                CoustomInputField(
                  controller: _landmark,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.length > 2) {
                      return null;
                    }
                    return 'Please Enter valid  Landmark';
                  },
                  labelText: "Landmark",
                ),
                const CoustomSpace(),
                CoustomInputField(
                  controller: _currentLocation,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.length > 2) {
                      return null;
                    }
                    return 'Please Enter valid  Current Location';
                  },
                  labelText: "Current Location",
                ),
                const CoustomSpace(),
                CoustomInputField(
                  controller: _password,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.length > 4) {
                      return null;
                    }
                    return 'Please Enter Atleast 4 characters';
                  },
                  labelText: "Password",
                ),
                const CoustomSpace(),
                CoustomInputField(
                  controller: _optional,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    return null;
                  },
                  labelText: "Referal",
                ),
                const CoustomSpace(),

                _loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CoustomButton(onPressed: _register, text: "Register"),
                // ignore: deprecated_member_use
              ],
            ),
          ),
        ),
      ),
    );
  }
}
