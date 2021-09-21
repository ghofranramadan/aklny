import 'dart:math' as math;

import 'package:aklny/ui/screens/login_screen.dart';
import 'package:aklny/ui/screens/main_screen.dart';
import 'package:aklny/ui/screens/otp_screen.dart';
import 'package:aklny/utils/components.dart';
import 'package:aklny/utils/vars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String pass;
  String confirmPass;
  String email;
  String name;
  String phoneNo;
  bool showPass = true;
  bool showConfirmPass = true;

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
        title: Text(
          tr('create_an_account'),
          style: Theme.of(context).textTheme.headline1.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 25 / 812,
          horizontal: MediaQuery.of(context).size.width * 22 / 375,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // Text(
                  //   tr('name'),
                  //   style: Theme.of(context).textTheme.headline2.copyWith(
                  //         fontWeight: FontWeight.w700,
                  //         fontSize: 13,
                  //       ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // TextFormField(
                  //   onSaved: (value) {
                  //     setState(() {
                  //       name = value;
                  //     });
                  //   },
                  //   onChanged: (value) {
                  //     setState(() {
                  //       name = value;
                  //     });
                  //   },
                  //   style: Theme.of(context).textTheme.headline1.copyWith(
                  //         fontSize: 14,
                  //       ),
                  //   decoration: InputDecoration(
                  //     hintText: tr('name'),
                  //     hintStyle: Theme.of(context).textTheme.headline5,
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     filled: true,
                  //     isDense: true,
                  //     focusColor: Theme.of(context).highlightColor,
                  //     fillColor: Theme.of(context).highlightColor,
                  //     hoverColor: Theme.of(context).highlightColor,
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // /////////
                  // Text(
                  //   tr('email'),
                  //   style: Theme.of(context).textTheme.headline2.copyWith(
                  //         fontWeight: FontWeight.w700,
                  //         fontSize: 13,
                  //       ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // TextFormField(
                  //   onSaved: (value) {
                  //     setState(() {
                  //       email = value;
                  //     });
                  //   },
                  //   onChanged: (value) {
                  //     setState(() {
                  //       email = value;
                  //     });
                  //   },
                  //   style: Theme.of(context).textTheme.headline1.copyWith(
                  //         fontSize: 14,
                  //       ),
                  //   decoration: InputDecoration(
                  //     hintText: tr('email'),
                  //     hintStyle: Theme.of(context).textTheme.headline5,
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     filled: true,
                  //     isDense: true,
                  //     focusColor: Theme.of(context).highlightColor,
                  //     fillColor: Theme.of(context).highlightColor,
                  //     hoverColor: Theme.of(context).highlightColor,
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // /////////

                  Text(
                    tr('enter_phone_no'),
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      tr('sign_up_intro'),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 46,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: Text(
                          '+2',
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: customTextField(
                          context: context,
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
                          hintText: 'phone_no',
                          keyboardType: TextInputType.phone,
                          maxLength: 11,
                        ),
                      ),
                    ],
                  ),

                  // TextFormField(
                  //   onSaved: (value) {
                  //     setState(() {
                  //       phoneNo = value;
                  //     });
                  //   },
                  //   onChanged: (value) {
                  //     setState(() {
                  //       phoneNo = value;
                  //     });
                  //   },
                  //   style: Theme.of(context).textTheme.headline1.copyWith(
                  //         fontSize: 14,
                  //       ),
                  //   keyboardType: TextInputType.phone,
                  //   decoration: InputDecoration(
                  //     hintText: tr('phone_no'),
                  //     hintStyle: Theme.of(context).textTheme.headline5,
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     filled: true,
                  //     isDense: true,
                  //     focusColor: Theme.of(context).highlightColor,
                  //     fillColor: Theme.of(context).highlightColor,
                  //     hoverColor: Theme.of(context).highlightColor,
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //   ),
                  // ),
                  // /////////////////////
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Text(
                  //   tr('password'),
                  //   style: Theme.of(context).textTheme.headline2.copyWith(
                  //         fontWeight: FontWeight.w700,
                  //         fontSize: 13,
                  //       ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // TextFormField(
                  //   style: Theme.of(context).textTheme.headline1.copyWith(
                  //         fontSize: 14,
                  //       ),
                  //   obscureText: showPass,
                  //   keyboardType: TextInputType.text,
                  //   onSaved: (value) {
                  //     setState(() {
                  //       pass = value;
                  //     });
                  //   },
                  //   onChanged: (value) {
                  //     setState(() {
                  //       pass = value;
                  //     });
                  //   },
                  //   decoration: InputDecoration(
                  //     suffixIconConstraints: BoxConstraints(
                  //       maxHeight: 24,
                  //       maxWidth: 41,
                  //     ),
                  //     suffixIcon: GestureDetector(
                  //       behavior: HitTestBehavior.opaque,
                  //       onLongPress: () {
                  //         setState(() => showPass = false);
                  //       },
                  //       onLongPressUp: () {
                  //         setState(() => showPass = true);
                  //       },
                  //       child: Container(
                  //         padding: EdgeInsets.only(
                  //           right: GetLAng?.lang == 'en_US' ?? true ? 17 : 0,
                  //           left: GetLAng?.lang == 'en_US' ?? true ? 0 : 17,
                  //         ),
                  //         child: showPass == true
                  //             ? SvgPicture.asset(
                  //                 'assets/svg/private.svg',
                  //               )
                  //             : SvgPicture.asset(
                  //                 'assets/svg/view.svg',
                  //               ),
                  //       ),
                  //     ),
                  //     hintText: tr('password'),
                  //     hintStyle: Theme.of(context).textTheme.headline5,
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     filled: true,
                  //     isDense: true,
                  //     focusColor: Theme.of(context).highlightColor,
                  //     fillColor: Theme.of(context).highlightColor,
                  //     hoverColor: Theme.of(context).highlightColor,
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //   ),
                  // ),
                  // //////////////
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Text(
                  //   tr('confirm_password'),
                  //   style: Theme.of(context).textTheme.headline2.copyWith(
                  //         fontWeight: FontWeight.w700,
                  //         fontSize: 13,
                  //       ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // TextFormField(
                  //   style: Theme.of(context).textTheme.headline1.copyWith(
                  //         fontSize: 14,
                  //       ),
                  //   obscureText: showConfirmPass,
                  //   keyboardType: TextInputType.text,
                  //   onSaved: (value) {
                  //     setState(() {
                  //       confirmPass = value;
                  //     });
                  //   },
                  //   onChanged: (value) {
                  //     setState(() {
                  //       confirmPass = value;
                  //     });
                  //   },
                  //   decoration: InputDecoration(
                  //     suffixIconConstraints: BoxConstraints(
                  //       maxHeight: 24,
                  //       maxWidth: 41,
                  //     ),
                  //     suffixIcon: GestureDetector(
                  //       behavior: HitTestBehavior.opaque,
                  //       onLongPress: () {
                  //         setState(() => showConfirmPass = false);
                  //       },
                  //       onLongPressUp: () {
                  //         setState(() => showConfirmPass = true);
                  //       },
                  //       child: Container(
                  //         padding: EdgeInsets.only(
                  //           right: GetLAng?.lang == 'en_US' ?? true ? 17 : 0,
                  //           left: GetLAng?.lang == 'en_US' ?? true ? 0 : 17,
                  //         ),
                  //         child: showConfirmPass == true
                  //             ? SvgPicture.asset(
                  //                 'assets/svg/private.svg',
                  //               )
                  //             : SvgPicture.asset(
                  //                 'assets/svg/view.svg',
                  //               ),
                  //       ),
                  //     ),
                  //     hintText: tr('confirm_password'),
                  //     hintStyle: Theme.of(context).textTheme.headline5,
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     filled: true,
                  //     isDense: true,
                  //     focusColor: Theme.of(context).highlightColor,
                  //     fillColor: Theme.of(context).highlightColor,
                  //     hoverColor: Theme.of(context).highlightColor,
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //   ),
                  // ),
                  //////////////
                  SizedBox(
                    height: 28,
                  ),
                  customButton(
                    context: context,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return OtpScreen(
                            createAccount: true,
                          );
                        },
                      ),
                    ),
                    text: Text(tr('continue'),
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tr("i_have_an_account"),
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
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Text(
                          tr('login'),
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Spacer(),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                height: 10,
                                color: Theme.of(context)
                                    .shadowColor
                                    .withOpacity(0.5),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              tr("continue_with"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
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
                                color: Theme.of(context)
                                    .shadowColor
                                    .withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              // onTap: () => loginWithGoogle(context),
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                height:
                                    (MediaQuery.of(context).size.height * 53) /
                                        812,
                                width:
                                    (MediaQuery.of(context).size.width * 160) /
                                        375,
                                margin: EdgeInsets.only(
                                  bottom: (MediaQuery.of(context).size.height *
                                          20) /
                                      812,
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
                                          (MediaQuery.of(context).size.width *
                                                  10) /
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
                                            fontSize:
                                                GetLAng?.lang == 'en_US' ?? true
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
                                    (MediaQuery.of(context).size.height * 53) /
                                        812,
                                width:
                                    (MediaQuery.of(context).size.width * 160) /
                                        375,
                                margin: EdgeInsets.only(
                                  bottom: (MediaQuery.of(context).size.height *
                                          20) /
                                      812,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                    color: Theme.of(context).buttonColor,
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
                                          (MediaQuery.of(context).size.width *
                                                  10) /
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
                                            fontSize:
                                                GetLAng?.lang == 'en_US' ?? true
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
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return MainScreen();
                                },
                              ),
                            ),
                            child: Text(
                              tr('continue_as_guest'),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
