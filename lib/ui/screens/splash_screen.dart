import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Background icons.png"))),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Image.asset('assets/images/aklny_logo2.png'),
            Positioned(
              right: 0,
                left: 140,
                bottom:30,
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
