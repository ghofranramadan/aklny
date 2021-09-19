import 'dart:math' as math;

import 'package:aklny/ui/screens/otp_screen.dart';
import 'package:aklny/utils/vars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassScreen extends StatefulWidget {
  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  String phoneNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Transform.rotate(
            angle: GetLAng?.lang == 'en_US' ?? true ? 180 * math.pi / 180 : 0,
            child: Container(
              alignment: Alignment.center,
              height: (MediaQuery.of(context).size.height * 48) / 812,
              width: (MediaQuery.of(context).size.width * 48) / 375,
              child: SvgPicture.asset(
                'assets/svg/Arrow - Left Circle.svg',
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 35 / 812,
                horizontal: MediaQuery.of(context).size.width * 22 / 375,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr('reset_password'),
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 271,
                      child: Text(
                        tr('reset'),
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    tr('phone_no'),
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState(() {
                        phoneNo = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        phoneNo = value;
                      });
                    },
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 14,
                        ),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: tr('phone_no'),
                      hintStyle: Theme.of(context).textTheme.headline5,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      filled: true,
                      isDense: true,
                      focusColor: Theme.of(context).highlightColor,
                      fillColor: Theme.of(context).highlightColor,
                      hoverColor: Theme.of(context).highlightColor,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return OtpScreen(
                              createAccount: false,
                            );
                          },
                        ),
                      ),
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          bottom:
                              (MediaQuery.of(context).size.height * 45) / 812,
                        ),
                        height: (MediaQuery.of(context).size.height * 53) / 812,
                        width: (MediaQuery.of(context).size.width * 258) / 375,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.65),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(tr('send'),
                            style: Theme.of(context).textTheme.headline3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
