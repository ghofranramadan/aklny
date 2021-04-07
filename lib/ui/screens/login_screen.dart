import 'package:aklny/ui/screens/create_account_screen.dart';
import 'package:aklny/ui/screens/forgot_pass_screen.dart';
import 'package:aklny/ui/screens/main_screen.dart';
import 'package:aklny/utils/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pass;
  String phoneNo;
  bool showPass = true;
  bool rememberMe = false;

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 35 / 812,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 22 / 375,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr('login'),
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                  ),
                  SizedBox(
                    height: 55,
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
                    decoration: InputDecoration(
                      hintText: tr('phone_no'),
                      hintStyle: Theme.of(context).textTheme.headline5,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      filled: true,
                      isDense: true,
                      focusColor: Theme.of(context).buttonColor,
                      fillColor: Theme.of(context).buttonColor,
                      hoverColor: Theme.of(context).buttonColor,
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
                  //////////////
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    tr('password'),
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 14,
                        ),
                    obscureText: showPass,
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      setState(() {
                        pass = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        pass = value;
                      });
                    },
                    decoration: InputDecoration(
                      suffixIconConstraints: BoxConstraints(
                        maxHeight: 24,
                        maxWidth: 41,
                      ),
                      suffixIcon: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onLongPress: () {
                          setState(() => showPass = false);
                        },
                        onLongPressUp: () {
                          setState(() => showPass = true);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            right: GetLAng?.lang == 'en_US' ?? true ? 17 : 0,
                            left: GetLAng?.lang == 'en_US' ?? true ? 0 : 17,
                          ),
                          child: showPass == true
                              ? SvgPicture.asset(
                                  'assets/svg/private.svg',
                                )
                              : SvgPicture.asset(
                                  'assets/svg/view.svg',
                                ),
                        ),
                      ),
                      hintText: tr('password'),
                      hintStyle: Theme.of(context).textTheme.headline5,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      filled: true,
                      isDense: true,
                      focusColor: Theme.of(context).buttonColor,
                      fillColor: Theme.of(context).buttonColor,
                      hoverColor: Theme.of(context).buttonColor,
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
                  ////
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: GetLAng?.lang == 'en_US' ?? true
                    ? MediaQuery.of(context).size.width * 22 / 375
                    : MediaQuery.of(context).size.width * 10 / 375,
                left: GetLAng?.lang == 'en_US' ?? true
                    ? MediaQuery.of(context).size.width * 10 / 375
                    : MediaQuery.of(context).size.width * 22 / 375,
                bottom: 35,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          checkColor: Theme.of(context).indicatorColor,
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                          activeColor: Theme.of(context).primaryColor,
                          value: rememberMe,
                          onChanged: (val) {
                            rememberMe = val;
                            setState(() {});
                          }),
                      Text(
                        tr('remember_me'),
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ForgotPassScreen();
                          },
                        ),
                      );
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Text(
                      tr('forgot_password'),
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            //////
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return MainScreen();
                  },
                ),
              ),
              behavior: HitTestBehavior.opaque,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  bottom: (MediaQuery.of(context).size.height * 20) / 812,
                ),
                height: (MediaQuery.of(context).size.height * 53) / 812,
                width: (MediaQuery.of(context).size.width * 258) / 375,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.65),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(tr('login'),
                    style: Theme.of(context).textTheme.headline3),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 22 / 375,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 10,
                          color: Theme.of(context).shadowColor.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        tr("continue_with"),
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(
                          height: 10,
                          color: Theme.of(context).shadowColor.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        // onTap: () => loginWithGoogle(context),
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          height:
                              (MediaQuery.of(context).size.height * 53) / 812,
                          width:
                              (MediaQuery.of(context).size.width * 160) / 375,
                          margin: EdgeInsets.only(
                            bottom:
                                (MediaQuery.of(context).size.height * 20) / 812,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/Icons-icon-google.svg',
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width * 10) /
                                        375,
                              ),
                              Text(
                                tr('login_with_google'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontWeight:
                                          GetLAng?.lang == 'en_US' ?? true
                                              ? FontWeight.w700
                                              : FontWeight.w400,
                                      fontSize: GetLAng?.lang == 'en_US' ?? true
                                          ? 14
                                          : 12,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        // onTap: () => loginWithFacebook(),
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          height:
                              (MediaQuery.of(context).size.height * 53) / 812,
                          width:
                              (MediaQuery.of(context).size.width * 160) / 375,
                          margin: EdgeInsets.only(
                            bottom:
                                (MediaQuery.of(context).size.height * 20) / 812,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Theme.of(context).highlightColor,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/Icons-icon-facebook.svg',
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width * 10) /
                                        375,
                              ),
                              Text(
                                tr('login_with_facebook'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      fontWeight:
                                          GetLAng?.lang == 'en_US' ?? true
                                              ? FontWeight.w700
                                              : FontWeight.w400,
                                      fontSize: GetLAng?.lang == 'en_US' ?? true
                                          ? 14
                                          : 12,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tr("don't_have_an_account"),
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 4) / 375,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return CreateAccountScreen();
                        },
                      ),
                    );
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Text(
                    tr('create_an_account'),
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return MainScreen();
                  },
                ),
              ),
              child: Text(
                tr('continue_as_guest'),
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
