import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget customButton({
  BuildContext context,
  Function onTap,
  Text text,
}) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: (MediaQuery.of(context).size.height * 53) / 812,
      width: (MediaQuery.of(context).size.width * 258) / 375,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.65),
        borderRadius: BorderRadius.circular(25),
      ),
      child: text,
    ),
  );
}

Widget customTextField({
  BuildContext context,
  Function onSaved,
  Function onChanged,
  String hintText,
  TextInputType keyboardType,
  int maxLength,
  BoxConstraints suffixIconConstraints,
  Widget suffixIcon,
  bool obscureText,
}) {
  return TextFormField(
    onSaved: onSaved,
    onChanged: onChanged,
    maxLength: maxLength,
    style: Theme.of(context).textTheme.headline1.copyWith(
          fontSize: 14,
        ),
    cursorColor: Theme.of(context).shadowColor,
    keyboardType: keyboardType,
    obscureText: obscureText ?? false,
    decoration: InputDecoration(
      suffixIconConstraints: suffixIconConstraints,
      suffixIcon: suffixIcon,
      counter: SizedBox(),
      hintText: tr('$hintText'),
      hintStyle: Theme.of(context).textTheme.headline5,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      filled: true,
      isDense: true,
      focusColor: Colors.transparent,
      fillColor: Colors.transparent,
      hoverColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}
