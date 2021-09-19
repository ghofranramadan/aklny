import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'restaurant',
        title: 'THE PADDOCK',
      ),
      new MenuItem(
        id: 'other1',
        title: 'THE HERO',
      ),
      new MenuItem(
        id: 'other2',
        title: 'HELP US GROW',
      ),
      new MenuItem(
        id: 'other3',
        title: 'SETTINGS',
      ),
    ],
  );

  var selectedMenuItemId = 'restaurant';
  var _widget = Text("1");

  Widget headerView(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "John Witch",
                      ),
                      Text(
                        "test123@gmail.com",
                      )
                    ],
                  ))
            ],
          ),
        ),
        Divider(
          color: Colors.white.withAlpha(200),
          height: 16,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).highlightColor,
        title: Text(
          "Drawer - Scale",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      defaultDirection: Direction.right,
      cornerRadius: 0,
      drawers: [
        SideDrawer(
          degree: 45,
          headerView: headerView(context),
          menu: menu,
          percentage: 0.6,
          direction: Direction.right, // Drawer position, left or right
          animation: true,
          color: Theme.of(context).highlightColor,
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
              if (itemId == 'restaurant') {
                setState(() => _widget = Text("1"));
              } else if (itemId == 'other1') {
                setState(() => _widget = Text("2"));
              } else if (itemId == 'other2') {
                setState(() => _widget = Text("3"));
              } else {
                setState(() => _widget = Text("4"));
              }
            });
          },
        )
      ],
      builder: (context, id) => Center(
        child: Text('$_widget'),
      ),
    );
  }
}
