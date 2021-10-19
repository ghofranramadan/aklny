import 'package:aklny/ui/screens/main_screen.dart';
import 'package:aklny/utils/components.dart';
import 'package:aklny/utils/vars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompleteUserScreen extends StatefulWidget {
  @override
  State<CompleteUserScreen> createState() => _CompleteUserScreenState();
}

class _CompleteUserScreenState extends State<CompleteUserScreen> {
  String pass;

  String confirmPass;

  String email;

  String firstName;
  String lastName;

  String phoneNo;

  bool showPass = true;

  bool showConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        svg: 'assets/svg/Arrow - Left Circle.svg',
        text: 'complete_data',
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
                  Text(
                    tr('complete_data'),
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    tr('complete_registration'),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: customTextField(
                          context: context,
                          onSaved: (value) {
                            setState(() {
                              firstName = value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              firstName = value;
                            });
                          },
                          hintText: 'first_name',
                          keyboardType: TextInputType.name,
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
                              lastName = value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              lastName = value;
                            });
                          },
                          hintText: 'last_name',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ///////////////////
                  customTextField(
                    context: context,
                    onSaved: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    hintText: 'email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ////////////////////////
                  customTextField(
                    context: context,
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
                    hintText: 'password',
                    keyboardType: TextInputType.text,
                    obscureText: showPass,
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 24,
                      maxWidth: 41,
                    ),
                    suffixIcon: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() => showPass = !showPass);
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customTextField(
                    context: context,
                    onSaved: (value) {
                      setState(() {
                        confirmPass = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        confirmPass = value;
                      });
                    },
                    hintText: 'confirm_password',
                    keyboardType: TextInputType.text,
                    obscureText: showConfirmPass,
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: 24,
                      maxWidth: 41,
                    ),
                    suffixIcon: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() => showConfirmPass = !showConfirmPass);
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
                  ),
                  //////////////
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
                    customButton(
                      context: context,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return MainScreen();
                          },
                        ),
                      ),
                      text: Text(tr('complete'),
                          style: Theme.of(context).textTheme.headline3),
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
