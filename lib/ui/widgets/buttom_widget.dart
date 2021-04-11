import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomWidget extends StatelessWidget {
  final String svgPic;
  final String title;
  final Function onTap;
  final bool selected;
  final EdgeInsetsGeometry padding;

  BottomWidget(
      {this.svgPic, this.onTap, this.selected, this.title, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              '$svgPic',
              width: 24,
              height: 24,
              color: selected == true
                  ? Theme.of(context).indicatorColor
                  : Theme.of(context).shadowColor,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '$title',
              style: selected == true
                  ? Theme.of(context).textTheme.headline3.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      )
                  : Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
