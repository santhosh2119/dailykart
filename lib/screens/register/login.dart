import 'package:daily_kart/providers/auth.dart';
import 'package:daily_kart/screens/home/home.dart';
import 'package:daily_kart/screens/register/phone_register.dart';
import 'package:daily_kart/widgets/coustom_button.dart';
import 'package:daily_kart/widgets/coustom_dialog.dart';
import 'package:daily_kart/widgets/coustom_input_text_field.dart';
import 'package:daily_kart/widgets/coustom_space.dart';
import 'package:daily_kart/widgets/coustom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController mobile = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  bool _loading = false;

  _register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PhoneRegister()),
    );
  }

  void _showErrorDialog(BuildContext context, String message, String header) {
    CoustomDialog(
      cxt: context,
      header: header,
      message: message,
    );
  }

  Future login(BuildContext context) async {
    if (_form.currentState!.validate()) {
      setState(() {
        _loading = true;
      });
      try {
        final data = await Provider.of<Auth>(context, listen: false)
            .loginIn(mobile.text, password.text);

        if (data[1]["message"] != null) {
          if (data[1]["message"] == 'Logged in successfully') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Home()),
            );
          }
          if (data[1]["message"] == 'Details incorrect') {
            setState(() {
              _loading = false;
            });
            _showErrorDialog(
                context, "Login Error", "Please Enter Valid details");
          }
          if (data[1]["message"] == 'User not registered') {
            setState(() {
              _loading = false;
            });
            _showErrorDialog(context, "Login Error", "User Not Registered");
          }
        }
      } catch (e) {
        setState(() {
          _loading = false;
        });

        _showErrorDialog(context, "Login Error", e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: SizedBox(
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 300,
                    child: Image.asset('assets/images/logo.png'),
                    padding: const EdgeInsets.only(bottom: 20),
                  ),
                  CoustomInputField(
                      controller: mobile,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.length != 10) {
                          return 'Please Enter Validate Mobile';
                        }
                        return null;
                      },
                      labelText: "Mobile Number"),
                  const CoustomSpace(),
                  CoustomInputField(
                      controller: password,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Please Enter Atleast 6 Charaters';
                        }
                        return null;
                      },
                      labelText: "Password"),
                  const CoustomSpace(),
                  _loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CoustomButton(
                          onPressed: () => login(context),
                          text: "Login",
                        ),
                  const CoustomSpace(),
                  CoustomTextButton(
                    onPressed: _register,
                    text: "Register",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
