import 'package:aklny/ui/screens/lang_selection_screen.dart';
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
    Future.delayed(Duration(seconds: 3), () {
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
                image: AssetImage("assets/images/Background icons.png"))),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Image.asset('assets/images/aklny_logo2.png'),
            Positioned(
                right: 0,
                left: 140,
                bottom: 30,
                child: Text(
                  'Food Delivery',
                  style: Theme.of(context).textTheme.headline1,
                )),
          ],
        ),
      ),
    );
  }
}
