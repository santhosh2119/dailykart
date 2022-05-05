// import 'package:flutter/material.dart';

// import 'background.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var windowWidth = MediaQuery.of(context).size.width;
//     var windowHeight = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             Container(
//               color: Colors.amber,
//             ),

//              IBackground4(width: windowWidth, colorsGradient: Colors.black12),
          

//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Hero(
//                     tag: "SplashLogo",
//                     child: Container(
//                       width: windowWidth * 0.75,
//                       child: Image.asset("assets/logo.png", fit: BoxFit.cover),
//                     ),
//                   ),
//                   Padding(padding: EdgeInsets.only(top: windowWidth * 0.05)),
//                 const  CircularProgressIndicator(
//                     backgroundColor: Colors.amber,
//                     valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     strokeWidth: 1,
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
