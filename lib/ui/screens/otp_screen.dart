import 'dart:async';

import 'package:aklny/ui/widgets/otp_form.dart';
import 'package:aklny/utils/vars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';

class OtpScreen extends StatefulWidget {
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
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
                  Container(
                    width: 271,
                    child: Text(
                      tr('sent_otp'),
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 271,
                    child: Text(
                      tr('check_number'),
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
                  FittedBox(child: OPTForm()),
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
                children: <Widget>[
                  Expanded(
                    child: SizedBox(),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      // onTap: () => Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return ();
                      //     },
                      //   ),
                      // ),
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
                        child: Text(tr('next'),
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
