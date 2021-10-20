import 'package:aklny/screens/lang_selection_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => LangSelectionScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,

        decoration: BoxDecoration(
            color: Color(0xFF667EEA),
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/images/new_splash.png"))),
        child: SizedBox(),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Image.asset(
        //       'assets/images/aklny_logo1.png',
        //       width: MediaQuery.of(context).size.width * 0.5,
        //       height: MediaQuery.of(context).size.height * 0.2,
        //       fit: BoxFit.fill,
        //     ),
        //     SizedBox(
        //       height: MediaQuery.of(context).size.height * 0.03,
        //     ),
        //     Text(
        //       'Food Delivery',
        //       style: Theme.of(context).textTheme.headline1,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
