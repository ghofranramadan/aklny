import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 22 / 375,
            vertical: MediaQuery.of(context).size.height * 15 / 812,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello , Guest',
                style: Theme.of(context).textTheme.headline2.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              Text(
                'Delivering to',
                style: Theme.of(context).textTheme.headline2.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                ),
              ),
              GestureDetector(
                //TODO:navigate to location page
                onTap: (){},
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        'Current Location',
                        style: Theme.of(context).textTheme.headline2.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
