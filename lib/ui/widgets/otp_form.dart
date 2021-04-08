import 'package:flutter/material.dart';

class OPTForm extends StatefulWidget {
  @override
  _OPTFormState createState() => _OPTFormState();
}

class _OPTFormState extends State<OPTForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
    super.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OTPTextField(
              firstPin: true,
              autoFocus: true,
              onChanged: (value) {
                nextField(value: value, focusNode: pin2FocusNode);
                setState(() {});
              },
            ),
            OTPTextField(
              autoFocus: false,
              focusNode: pin2FocusNode,
              onChanged: (value) {
                nextField(value: value, focusNode: pin3FocusNode);
                setState(() {});
              },
            ),
            OTPTextField(
              autoFocus: false,
              focusNode: pin3FocusNode,
              onChanged: (value) {
                nextField(value: value, focusNode: pin4FocusNode);
                setState(() {});
              },
            ),
            OTPTextField(
              autoFocus: false,
              focusNode: pin4FocusNode,
              onChanged: (value) {
                nextField(value: value, focusNode: pin5FocusNode);
                setState(() {});
              },
            ),
            OTPTextField(
              autoFocus: false,
              focusNode: pin5FocusNode,
              onChanged: (value) {
                nextField(value: value, focusNode: pin6FocusNode);
                setState(() {});
              },
            ),
            OTPTextField(
              autoFocus: false,
              focusNode: pin6FocusNode,
              onChanged: (value) {
                pin6FocusNode.unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OTPTextField extends StatelessWidget {
  final bool firstPin;
  final bool autoFocus;
  final Function onChanged;
  final FocusNode focusNode;
  final Orientation orientation;

  OTPTextField(
      {this.autoFocus,
      this.onChanged,
      this.focusNode,
      this.orientation,
      this.firstPin = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: (MediaQuery.of(context).size.width * 56) / 375,
          height: (MediaQuery.of(context).size.height * 56) / 812,
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: focusNode?.hasFocus ?? false || firstPin
              ? TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  showCursor: false,
                  autofocus: autoFocus,
                  focusNode: focusNode,
                  maxLength: 1,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                  textAlign: TextAlign.center,
                  cursorColor: Colors.transparent,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    isDense: true,
                    focusColor: Colors.transparent,
                    fillColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    counterText: "",
                    hintText: '*',
                    hintStyle: Theme.of(context).textTheme.headline5.copyWith(
                          color: Color(0xFF000000),
                          fontSize: 35,
                        ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: onChanged,
                )
              : TextFormField(
                  showCursor: false,
                  textAlignVertical: TextAlignVertical.center,
                  autofocus: autoFocus,
                  focusNode: focusNode,
                  maxLength: 1,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                  textAlign: TextAlign.center,
                  cursorColor: Colors.transparent,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    isDense: true,
                    focusColor: Colors.transparent,
                    fillColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    counterText: "",
                    hintText: '*',
                    hintStyle: Theme.of(context).textTheme.headline5.copyWith(
                          fontSize: 35,
                        ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: onChanged,
                ),
        ),
        SizedBox(
          width: 5,
        )
      ],
    );
  }
}
