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
