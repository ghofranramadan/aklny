import 'package:aklny/screens/login_screen.dart';
import 'package:aklny/screens/main_screen.dart';
import 'package:aklny/screens/otp_screen.dart';
import 'package:aklny/utils/components.dart';
import 'package:aklny/utils/vars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flrx_validator/flrx_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String phoneNo;
  bool showLoading = false;
  String verificationId;
  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    } else {
      _formKey.currentState.save();
      try {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              createAccount: true,
            ),
          ),
        );

        // setState(() {
        //   showLoading = true;
        // });
        // ////////////////////////////////////////////
        // await auth.verifyPhoneNumber(
        //   phoneNumber: phoneNo,
        //   verificationCompleted: (phoneAuthCredential) async {
        //     setState(() {
        //       showLoading = false;
        //     });
        //     //signInWithPhoneAuthCredential(phoneAuthCredential);
        //   },
        //   verificationFailed: (verificationFailed) async {
        //     setState(() {
        //       showLoading = false;
        //     });
        //     Fluttertoast.showToast(
        //         msg: "${verificationFailed.message}",
        //         toastLength: Toast.LENGTH_LONG,
        //         gravity: ToastGravity.BOTTOM,
        //         timeInSecForIosWeb: 5,
        //         backgroundColor: Colors.red,
        //         textColor: Colors.white,
        //         fontSize: 16.0);
        //   },
        //   codeSent: (verificationId, resendingToken) async {
        //     setState(() {
        //       showLoading = false;
        //       this.verificationId = verificationId;
        //     });
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (context) => OtpScreen(
        //           createAccount: true,
        //         ),
        //       ),
        //     );
        //   },
        //   codeAutoRetrievalTimeout: (verificationId) async {},
        // );
        ////////////////////////////////////////////
        // await context.read<AuthProvider>().signup(
        //     UserModel(
        //       name: _name,
        //       type: '',
        //       number: _phone,
        //       address: _address,
        //       companyName: _companyName,
        //       email: _email,
        //       imagePath: '',
        //       imageUrl: '',
        //     ),
        //     _password);
        // setState(() {
        //   showLoading = false;
        // });
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => OtpScreen(
        //       createAccount: true,
        //     ),
        //   ),
        // );
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(builder: (context) =>  OtpScreen(
        //                 createAccount: true,
        //               ),),
        // );
      }
      // on FirebaseAuthException catch (e, s) {
      //   Navigator.of(context).pop();
      //   print(' error ${e.code}');
      //   if (e.code == 'email-already-in-use') {
      //     print(' error ${e.code}');
      //     // Alert(
      //     //   context: context,
      //     //   title: 'Email Already in use!',
      //     //   buttons: [
      //     //     DialogButton(
      //     //       color: Color(0xff055261),
      //     //       child: Text(
      //     //         'Okay',
      //     //         style: TextStyle(
      //     //           fontFamily: 'SF Pro Display',
      //     //           fontSize: 16,
      //     //           color: const Color(0xffb9cc66),
      //     //           fontWeight: FontWeight.w600,
      //     //         ),
      //     //         textAlign: TextAlign.center,
      //     //       ),
      //     //       onPressed: () => Navigator.of(context).pop(),
      //     //     ),
      //     //   ],
      //     // ).show();
      //   } else if (e.code == 'invalid-email') {
      //     print(' error ${e.code}');
      //     // Alert(
      //     //   context: context,
      //     //   title: 'please enter correct email.',
      //     //   buttons: [
      //     //     DialogButton(
      //     //       color: Color(0xff055261),
      //     //       child: Text(
      //     //         'Okay',
      //     //         style: TextStyle(
      //     //           fontFamily: 'SF Pro Display',
      //     //           fontSize: 16,
      //     //           color: const Color(0xffb9cc66),
      //     //           fontWeight: FontWeight.w600,
      //     //         ),
      //     //         textAlign: TextAlign.center,
      //     //       ),
      //     //       onPressed: () => Navigator.of(context).pop(),
      //     //     ),
      //     //   ],
      //     // ).show();
      //   }
      // }
      catch (e) {
        print(' error ${e.toString()}');
        // Navigator.of(context).pop();
        // Alert(
        //   context: context,
        //   title: 'something wrong happened, please try again',
        //   buttons: [
        //     DialogButton(
        //       color: Color(0xff055261),
        //       child: Text(
        //         'Okay',
        //         style: TextStyle(
        //           fontFamily: 'SF Pro Display',
        //           fontSize: 16,
        //           color: const Color(0xffb9cc66),
        //           fontWeight: FontWeight.w600,
        //         ),
        //         textAlign: TextAlign.center,
        //       ),
        //       onPressed: () => Navigator.of(context).pop(),
        //     ),
        //   ],
        // ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        svg: 'assets/svg/Arrow - Left Circle.svg',
        text: 'create_an_account',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 25 / 812,
          horizontal: MediaQuery.of(context).size.width * 22 / 375,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
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
                            validator: Validator(
                              rules: [
                                RequiredRule(
                                    validationMessage:
                                        'Phone number is required'),
                                MinLengthRule(11,
                                    validationMessage:
                                        'Phone number is 11 number'),
                              ],
                            ),
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
                    SizedBox(
                      height: 28,
                    ),
                    showLoading
                        ? CircularProgressIndicator()
                        : customButton(
                            context: context,
                            onTap: () => _submit(),
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
                            style:
                                Theme.of(context).textTheme.headline4.copyWith(
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
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MainScreen();
                              },
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
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
