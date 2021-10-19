import 'package:aklny/utils/vars.dart';
import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'My Account',
        title: 'My Account',
      ),
      new MenuItem(
        id: 'Settings',
        title: 'Settings',
      ),
      new MenuItem(
        id: 'Other',
        title: 'Other',
      ),
      new MenuItem(
        id: 'Follow us on',
        title: 'Follow us on',
      ),
      new MenuItem(
        id: 'Invite a friend',
        title: 'Invite a friend',
      ),
      new MenuItem(
        id: 'Logout',
        title: 'Logout',
      ),
    ],
  );

  var selectedMenuItemId = 'restaurant';
  var _widget = Text("1");

  Widget headerView(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Container(
            width: 230,
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor.withOpacity(0.80),
                  ),
                  child: ClipOval(
                    child: SvgPicture.asset(
                      'assets/svg/profile.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Ghofran Ramadan",
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          "ghofranramadan55@gmail.com",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
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
      extendedBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme:
            IconThemeData(color: Theme.of(context).primaryColor, size: 50),
      ),
      defaultDirection:
          GetLAng?.lang == 'en_US' ?? true ? Direction.right : Direction.left,
      cornerRadius: 15,
      resizeToAvoidBottomInset: true,
      drawers: [
        SideDrawer(
          degree: 0.0,
          drawerWidth: 230,
          percentage: 0.7,

          headerView: headerView(context),
          menu: menu,
          direction: GetLAng?.lang == 'en_US' ?? true
              ? Direction.left
              : Direction.right, // Drawer position, left or right
          animation: true,
          color: Theme.of(context).primaryColor.withOpacity(0.4),
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (itemId) {
            setState(() {
              selectedMenuItemId = itemId;
              if (itemId == 'My Account') {
                setState(() => _widget = Text("My Account"));
              } else if (itemId == 'Settings') {
                setState(() => _widget = Text("Settings"));
              } else if (itemId == 'Other') {
                setState(() => _widget = Text("Other"));
              } else if (itemId == 'Follow us on') {
                setState(() => _widget = Text("Follow us on"));
              } else if (itemId == 'Invite a friend') {
                setState(() => _widget = Text("Invite a friend"));
              } else {
                setState(() => _widget = Text("Logout"));
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
