import 'package:daily_kart/providers/auth.dart';
import 'package:daily_kart/screens/home/home.dart';
import 'package:daily_kart/screens/register/locations_screen.dart';
import 'package:daily_kart/screens/register/phone_register.dart';
import 'package:daily_kart/screens/register/reset_password.dart';
import 'package:daily_kart/widgets/coustom_button.dart';
import 'package:daily_kart/widgets/coustom_input_text_field.dart';
import 'package:daily_kart/widgets/coustom_space.dart';
import 'package:daily_kart/widgets/coustom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:provider/provider.dart';

class VerifyForgotpPasswordOtp extends StatefulWidget {
  final String mobile;
  const VerifyForgotpPasswordOtp({required this.mobile, Key? key}) : super(key: key);

  @override
  State<VerifyForgotpPasswordOtp> createState() => _VerifyForgotpPasswordOtpState();
}

class _VerifyForgotpPasswordOtpState extends State<VerifyForgotpPasswordOtp> {
  final TextEditingController otpEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool loading = false;
  void _showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Invalid OTP'),
        content: Text(error),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('OK!'),
          ),
        ],
      ),
    );
  }

  Future<void> VerifyForgotpPasswordOtp(String mobileNumber, String otp) async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          loading = true;
        });
        final otpstats = await Provider.of<Auth>(context, listen: false)
            .verifyForgotpPasswordOtp(mobileNumber, otp);
        setState(() {
          loading = false;
        });


        print(otpstats[1]["userid"]);
        //
        // // print(otpstats[1]["steps_completed"]);
        // if (otpstats[1]['status']) {
        //   //showAlert(context, isSuccess[1]);
        //
        //   if (otpstats[1]["steps_completed"] == 2) {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) => LocationScreen(
        //               mobile: mobileNumber, userId: otpstats[1]["userid"])),
        //     );
        //   } else {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => Home()),
        //     );
        //   }
        // } else {
        //   _showErrorDialog(context, "Please Enter Correct OTP");
        // }
      } catch (error) {
        rethrow;
      }
    }
  }

  _forgot_password() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResetPassword()),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.mobile,
                      ),
                      CoustomTextButton(
                          onPressed: _forgot_password, text: "Not Yours?")
                    ],
                  ),
                  CoustomInputField(
                    controller: otpEditingController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value?.length != 4) {
                        return 'Please Enter 4 digits code';
                      }
                      return null;
                    },
                    labelText: "Verification code",
                  ),
                  const CoustomSpace(),
                  loading
                      ? const Center(child: CircularProgressIndicator())
                      : CoustomButton(
                    onPressed: () => VerifyForgotpPasswordOtp(
                        widget.mobile, otpEditingController.text),
                    text: "verify OTP",
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
