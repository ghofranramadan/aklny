import 'package:aklny/ui/screens/intro_screen.dart';
import 'package:aklny/utils/components.dart';
import 'package:aklny/utils/vars.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:shadow/shadow.dart';

class LangSelectionScreen extends StatefulWidget {
  @override
  _LangSelectionScreenState createState() => _LangSelectionScreenState();
}

class _LangSelectionScreenState extends State<LangSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.65,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.55,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Shadow(
                    offset: Offset(0, 15),
                    opacity: 0.2,
                    child: Image.asset(
                      'assets/images/Group 8187.png',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/aklny_logo1.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Food Delivery',
          style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 14,
              ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Select Your Language',
          style: Theme.of(context).textTheme.headline2.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
        ),
        SizedBox(
          height: 10,
        ),
        customButton(
          context: context,
          onTap: () {
            GetLAng.lang = 'en_US';
            if (mounted) setState(() {});
            context.setLocale(Locale('en', 'US'));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return IntroScreen();
                },
              ),
            );
          },
          text: 'English',
          textStyle: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(fontSize: 24, fontFamily: 'SF UI Display'),
        ),
        customButton(
          context: context,
          onTap: () {
            GetLAng.lang = 'ar_EG';
            if (mounted) setState(() {});
            context.setLocale(Locale('ar', 'EG'));
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return IntroScreen();
                },
              ),
            );
          },
          text: 'العربيه',
          textStyle: Theme.of(context).textTheme.headline3.copyWith(
              fontFamily: 'Tajawal', fontSize: 27, fontWeight: FontWeight.w700),
        ),
      ],
    ));
  }
}
