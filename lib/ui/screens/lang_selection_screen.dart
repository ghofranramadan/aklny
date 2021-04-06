import 'package:aklny/ui/screens/login_screen.dart';
import 'package:aklny/utils/vars.dart';
import 'package:flutter/material.dart';
import 'package:shadow/shadow.dart';
import 'package:easy_localization/easy_localization.dart';

class LangSelectionScreen extends StatefulWidget {
  @override
  _LangSelectionScreenState createState() => _LangSelectionScreenState();
}

class _LangSelectionScreenState extends State<LangSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shadow(
              offset: Offset(20, 10),
              opacity: 0.2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    'assets/images/Group 8187.png',
                  ),
                ),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    GetLAng.lang = 'en_US';
                    if (mounted) setState(() {});
                    context.setLocale(Locale('en', 'US'));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: (MediaQuery.of(context).size.height * 20) / 812,
                    ),
                    alignment: Alignment.center,
                    height: (MediaQuery.of(context).size.height * 53) / 812,
                    width: (MediaQuery.of(context).size.width * 258) / 375,
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(16.5),
                    ),
                    child: Text(
                      'START',
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: 24, fontFamily: 'SF UI Display'),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    GetLAng.lang = 'ar_EG';
                    if (mounted) setState(() {});
                    context.setLocale(Locale('ar', 'EG'));
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: (MediaQuery.of(context).size.height * 60) / 812,
                    ),
                    alignment: Alignment.center,
                    height: (MediaQuery.of(context).size.height * 53) / 812,
                    width: (MediaQuery.of(context).size.width * 258) / 375,
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(16.5),
                    ),
                    child: Text(
                      'إبدأ',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontFamily: 'Almarai',
                          fontSize: 27,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          right: 0,
          left: 0,
          top:MediaQuery.of(context).size.height * 0.37 ,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/aklny_logo1.png',
                width: (MediaQuery.of(context).size.width * 200) / 375,
                height: (MediaQuery.of(context).size.height * 170) / 812,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Food Delivery',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        )
      ],
    )
        );
  }
}
