import 'package:aklny/ui/screens/otp_screen.dart';
import 'package:aklny/utils/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgotPassScreen extends StatefulWidget {
  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  String phoneNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        svg: 'assets/svg/Arrow - Left Circle.svg',
        text: 'reset_password',
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
                    tr('forgot_password'),
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    tr('reset'),
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
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return OtpScreen(
                            createAccount: false,
                          );
                        },
                      ),
                    ),
                    text: Text(tr('send'),
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
