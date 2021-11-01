import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  final String picture;
  final String title;
  final String subTitle;

  OnBoarding({
    this.picture,
    this.title,
    this.subTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          '$picture',
          height: MediaQuery.of(context).size.height * 0.5,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height * 100) / 812,
        ),
        Text(
          tr('$title'),
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontFamily: 'CopperplateGothic',
              fontSize: 28,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height * 20) / 812,
        ),
        Container(
          width: 275,
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Text(
            tr('$subTitle'),
            maxLines: 2,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 12,
                ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
