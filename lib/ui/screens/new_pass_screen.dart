import 'dart:math' as math;

import 'package:aklny/ui/screens/login_screen.dart';
import 'package:aklny/utils/vars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewPassScreen extends StatefulWidget {
  @override
  _NewPassScreenState createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  String newPass;
  String confirmNewPass;
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
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      tr('new_Password'),
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
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
                        tr('enter_your_new_password'),
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
                    height: 20,
                  ),
                  Text(
                    tr('new_Password'),
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
                        newPass = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        newPass = value;
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
                      hintText: tr('new_Password'),
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
                  //////////////
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    tr('confirm_new_password'),
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
                    obscureText: showConfirmPass,
                    keyboardType: TextInputType.text,
                    onSaved: (value) {
                      setState(() {
                        confirmNewPass = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        confirmNewPass = value;
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
                          setState(() => showConfirmPass = false);
                        },
                        onLongPressUp: () {
                          setState(() => showConfirmPass = true);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            right: GetLAng?.lang == 'en_US' ?? true ? 17 : 0,
                            left: GetLAng?.lang == 'en_US' ?? true ? 0 : 17,
                          ),
                          child: showConfirmPass == true
                              ? SvgPicture.asset(
                                  'assets/svg/private.svg',
                                )
                              : SvgPicture.asset(
                                  'assets/svg/view.svg',
                                ),
                        ),
                      ),
                      hintText: tr('confirm_new_password'),
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
                      onTap: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                          (route) => false),
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
                        child: Text(tr('save'),
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
