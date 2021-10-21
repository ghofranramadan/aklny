import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String name;
  CategoryWidget({this.name, this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            child: Image(
              image: NetworkImage(
                "$image",
              ),
              width: double.infinity,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              width: 155,
              padding: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                "$name",
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
