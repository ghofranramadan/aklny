import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MoreScreen extends StatefulWidget {
  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  // double value = 0;
  //
  // Widget _widget = Text("Open Drawer");
  double xOffset;
  double yOffset;
  double scaleFactor;
  void openDrawer() => setState(() {
        xOffset = 230;
        yOffset = 110;
        scaleFactor = 0.70;
        isDrawerOpen = true;
      });
  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    closeDrawer();
  }

  bool isDragging = false;
  bool isDrawerOpen;
  Widget _widget = Text('Hello World');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.4),
            body: SafeArea(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              width: 230,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 230,
                      child: Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            width: 55,
                            height: 55,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .copyWith(
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
                    Divider(
                      color: Theme.of(context).dividerColor,
                      height: 20,
                      // endIndent: 15,
                    ),
                    ExpansionTile(
                      title: Text('Home'),
                      leading: Icon(Icons.home),
                      children: [
                        ListTile(
                          onTap: () {
                            setState(() => _widget = Text("Home.1"));
                            closeDrawer();
                          },
                          trailing: Icon(Icons.home),
                          title: Text('Home'),
                        ),
                        ListTile(
                          onTap: () {
                            setState(() => _widget = Text("Profile.1"));
                            closeDrawer();
                          },
                          trailing: Icon(Icons.account_circle_rounded),
                          title: Text('Profile'),
                        ),
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.favorite),
                          title: Text('Favourites'),
                        ),
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.settings),
                          title: Text('Settings'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Profile'),
                      leading: Icon(Icons.account_circle_rounded),
                      children: [
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.home),
                          title: Text('Home'),
                        ),
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.account_circle_rounded),
                          title: Text('Profile'),
                        ),
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.favorite),
                          title: Text('Favourites'),
                        ),
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.settings),
                          title: Text('Settings'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Favourites'),
                      leading: Icon(Icons.favorite),
                      children: [
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.home),
                          title: Text('Home'),
                        ),
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.account_circle_rounded),
                          title: Text('Profile'),
                        ),
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.favorite),
                          title: Text('Favourites'),
                        ),
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.settings),
                          title: Text('Settings'),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Settings'),
                      leading: Icon(Icons.settings),
                      children: [
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.home),
                          title: Text('Home'),
                        ),
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.account_circle_rounded),
                          title: Text('Profile'),
                        ),
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.favorite),
                          title: Text('Favourites'),
                        ),
                        ListTile(
                          onTap: () {},
                          trailing: Icon(Icons.settings),
                          title: Text('Settings'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          ),
          // DrawerItems(),
          GestureDetector(
            onTap: closeDrawer,
            onHorizontalDragStart: (details) => isDragging = true,
            onHorizontalDragUpdate: (details) {
              if (!isDragging) return;
              const delta = 1;
              if (details.delta.dx > delta) {
                openDrawer();
              } else if (details.delta.dx < -delta) {
                closeDrawer();
              }
              isDragging = false;
            },
            child: AnimatedContainer(
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor),
              duration: Duration(milliseconds: 250),
              child: ClipRRect(
                borderRadius: isDrawerOpen
                    ? BorderRadius.circular(25)
                    : BorderRadius.zero,
                child: AbsorbPointer(
                  absorbing: isDrawerOpen,
                  child: Scaffold(
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
                            ),
                            Center(child: _widget)
                          ],
                        ),
                      ),
                    ),
                  ),
                  // DrawerPage(
                  //   openDrawer: openDrawer,
                  // ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
