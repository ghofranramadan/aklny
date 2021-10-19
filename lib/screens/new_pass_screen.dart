import 'package:aklny/ui/screens/login_screen.dart';
import 'package:aklny/utils/components.dart';
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
      appBar: customAppBar(
        context: context,
        text: 'new_Password',
        svg: 'assets/svg/Arrow - Left Circle.svg',
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
                children: [
                  Text(
                    tr('new_Password'),
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    tr('enter_your_new_password'),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  customTextField(
                    context: context,
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
                    hintText: 'new_Password',
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
                        confirmNewPass = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        confirmNewPass = value;
                      });
                    },
                    hintText: 'confirm_new_password',
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
                  Spacer(),
                  customButton(
                    context: context,
                    onTap: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                        (route) => false),
                    text: Text(tr('save'),
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  SizedBox(
                    height: 15,
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
