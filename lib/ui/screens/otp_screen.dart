import 'dart:async';
import 'dart:math' as math;

import 'package:aklny/ui/screens/complete_user_data_screen.dart';
import 'package:aklny/ui/screens/new_pass_screen.dart';
import 'package:aklny/utils/components.dart';
import 'package:aklny/utils/vars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final bool createAccount;
  OtpScreen({@required this.createAccount});
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _counter = 30;

  Timer _timer;

  _resend() async {
    try {
      //TODO:add logic
      _timer?.cancel();
      _counter = 30;
      if (mounted) setState(() {});

      _timer = Timer.periodic(Duration(seconds: 1), (_) {
        if (_counter > 0) _counter--;
        if (mounted) setState(() {});
      });
    } catch (e, s) {
      Navigator.pop(context);
      print(e);
      print(s);
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_counter > 0) _counter--;
      if (mounted) setState(() {});
    });
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    _timer?.cancel();
    errorController.close();
    super.dispose();
  }

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";
  StreamController<ErrorAnimationType> errorController;
  String currentText = "";

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      tr('sent_otp'),
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      tr('enter_otp'),
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                        color: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      activeColor: Colors.transparent,
                      inactiveColor: Colors.transparent,
                      selectedColor: Colors.transparent,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 60,
                      fieldWidth: 50,
                      inactiveFillColor: Colors.grey[100],
                      activeFillColor:
                          Theme.of(context).primaryColor.withOpacity(0.7),
                      selectedFillColor: Colors.grey[100],
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    animationDuration: Duration(milliseconds: 300),
                    textStyle: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: 20,
                          height: 1.6,
                        ),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 43) / 812,
                  ),
                  Text(tr('code_not_been_sent'),
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: 14,
                          )),
                  _counter == 0
                      ? InkWell(
                          onTap: () => _resend(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 4),
                            child: Text(tr('send_another_one'),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                      fontSize: 14,
                                    )),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(tr('send_another_one'),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                      fontSize: 14,
                                    )),
                            SizedBox(
                              width: 7,
                            ),
                            Text('00:$_counter',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(
                                      fontSize: 14,
                                    )),
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  customButton(
                    context: context,
                    onTap: widget.createAccount == true
                        ? () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return CompleteUserScreen();
                                },
                              ),
                            )
                        : () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return NewPassScreen();
                                },
                              ),
                            ),
                    text: Text(tr('verify_continue'),
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 35) / 812,
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
