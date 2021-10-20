import 'package:aklny/screens/onbording_screen.dart';
import 'package:aklny/utils/components.dart';
import 'package:aklny/utils/vars.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class LangSelectionScreen extends StatefulWidget {
  @override
  _LangSelectionScreenState createState() => _LangSelectionScreenState();
}

class _LangSelectionScreenState extends State<LangSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              // color: Colors.white,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Image.asset(
                'assets/images/select_lang.png',
                // height: MediaQuery.of(context).size.height * 0.2,
                fit: BoxFit.contain,
              ),

              // child: Stack(
              //   children: [
              //     SimpleShadow(
              //       opacity: 0.6,
              //       color: Theme.of(context).primaryColor,
              //       offset: Offset(0, 15),
              //       sigma: 7,
              //       child: Image(
              //         image: AssetImage(
              //           'assets/images/Group 8187.png',
              //         ),
              //         width: double.infinity,
              //         height: MediaQuery.of(context).size.height * 0.55,
              //         fit: BoxFit.fill,
              //       ),
              //     ),
              //     Align(
              //       alignment: Alignment.bottomCenter,
              //       child: Image.asset(
              //         'assets/images/aklny_logo1.png',
              //         width: MediaQuery.of(context).size.width * 0.5,
              //         height: MediaQuery.of(context).size.height * 0.2,
              //         fit: BoxFit.fill,
              //       ),
              //     ),
              //   ],
              // ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Salla',
              style: TextStyle(
                color: Color(0xFF000000),
                fontFamily: 'Viner',
                fontSize: 50,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Online Shopping',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 14,
                  ),
            ),
            Spacer(),
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
              text: Text(
                'English',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontSize: 24, fontFamily: 'SF UI Display'),
              ),
            ),
            SizedBox(
              height: 20,
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
              text: Text(
                'العربيه',
                style: Theme.of(context).textTheme.headline3.copyWith(
                    fontFamily: 'Tajawal',
                    fontSize: 27,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
