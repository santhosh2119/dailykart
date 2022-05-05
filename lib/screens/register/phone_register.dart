import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/providers/auth.dart';
import 'package:daily_kart/screens/register/login.dart';
import 'package:daily_kart/widgets/coustom_button.dart';
import 'package:daily_kart/widgets/coustom_input_text_field.dart';
import 'package:daily_kart/widgets/coustom_space.dart';
import 'package:daily_kart/widgets/coustom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'verify_otp.dart';

class PhoneRegister extends StatefulWidget {
  const PhoneRegister({Key? key}) : super(key: key);

  @override
  _PhoneRegisterState createState() => _PhoneRegisterState();
}

class _PhoneRegisterState extends State<PhoneRegister> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool loading = false;
  void _showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Registration Failed'),
        content: Text(error),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK!'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Text('Login'),
          )
        ],
      ),
    );
  }

  Future<void> _registerphone() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      try {
        final register = await Provider.of<Auth>(context, listen: false)
            .mobileRegistrationOTP(_phoneController.text);
        setState(() {
          loading = false;
        });
        if (register[1]["isRegistered"]) {
          _showErrorDialog(context, "Mobile Number Already Exits Please Login");
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyOtp(mobile: _phoneController.text)),
          );
        }
      } catch (error) {
        rethrow;
      }
    }
    // Navigator.of(context).pushNamed(VerifyOtp.routeName);
  }

  _login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: SizedBox(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 300,
                    child: Image.asset('assets/images/logo.png'),
                    padding: const EdgeInsets.only(bottom: 20),
                  ),
                  CoustomInputField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value!.length != 10) {
                        return 'Please Enter Validate Mobile';
                      }
                      return null;
                    },
                    labelText: "Mobile Number",
                  ),
                  const CoustomSpace(),
                  loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CoustomButton(
                          onPressed: _registerphone,
                          text: "Send OTP",
                        ),
                  const CoustomSpace(),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        CoustomTextButton(onPressed: _login, text: "Login")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
