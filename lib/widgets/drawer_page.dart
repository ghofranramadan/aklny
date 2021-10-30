import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  final VoidCallback openDrawer;

  DrawerPage({@required this.openDrawer});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                    ),
                    iconSize: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
