import 'package:aklny/utils/vars.dart';
import 'package:drawerbehavior/drawer_scaffold.dart';
import 'package:drawerbehavior/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final _advancedDrawerController = AdvancedDrawerController();
  //
  // void _handleMenuButtonPressed() {
  //   // NOTICE: Manage Advanced Drawer state through the Controller.
  //   // _advancedDrawerController.value = AdvancedDrawerValue.visible();
  //   _advancedDrawerController.showDrawer();
  // }
  //
  // var _widget = Text("1");
  //
  // @override
  // Widget build(BuildContext context) {
  //   return AdvancedDrawer(
  //     backdropColor: Theme.of(context).highlightColor,
  //     controller: _advancedDrawerController,
  //     animationCurve: Curves.easeInOut,
  //     animationDuration: const Duration(milliseconds: 300),
  //     animateChildDecoration: true,
  //     rtlOpening: false,
  //     disabledGestures: false,
  //     childDecoration: const BoxDecoration(
  //       shape: BoxShape.circle,
  //       // NOTICE: Uncomment if you want to add shadow behind the page.
  //       // Keep in mind that it may cause animation jerks.
  //       // boxShadow: <BoxShadow>[
  //       //   BoxShadow(
  //       //     color: Colors.black,
  //       //     blurRadius: 12,
  //       //   ),
  //       // ],
  //       borderRadius: const BorderRadius.all(Radius.circular(16)),
  //     ),
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Advanced Drawer Example'),
  //         leading: IconButton(
  //           onPressed: _handleMenuButtonPressed,
  //           icon: ValueListenableBuilder<AdvancedDrawerValue>(
  //             valueListenable: _advancedDrawerController,
  //             builder: (_, value, __) {
  //               return AnimatedSwitcher(
  //                 duration: Duration(milliseconds: 250),
  //                 child: Icon(
  //                   value.visible ? Icons.clear : Icons.menu,
  //                   key: ValueKey<bool>(value.visible),
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //       ),
  //       body: Container(
  //         child: Center(child: _widget),
  //       ),
  //     ),
  //     drawer: Container(
  //       alignment: Alignment.topCenter,
  //       child: SingleChildScrollView(
  //         padding: EdgeInsets.zero,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Container(
  //               width: 80.0,
  //               height: 80.0,
  //               // margin: const EdgeInsets.only(
  //               //   top: 10.0,
  //               //   bottom: 10.0,
  //               // ),
  //               clipBehavior: Clip.antiAlias,
  //               decoration: BoxDecoration(
  //                 color: Colors.black26,
  //                 shape: BoxShape.circle,
  //               ),
  //               child: Image.asset(
  //                 'assets/images/Mask Group 6.png',
  //               ),
  //             ),
  //             Column(
  //               children: [
  //                 ExpansionTile(
  //                   title: Text('Home'),
  //                   leading: Icon(Icons.home),
  //                   children: [
  //                     ListTile(
  //                       onTap: () {
  //                         setState(() => _widget = Text("Home.1"));
  //                         _advancedDrawerController.toggleDrawer();
  //                       },
  //                       trailing: Icon(Icons.home),
  //                       title: Text('Home'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {
  //                         setState(() => _widget = Text("Profile.1"));
  //                         _advancedDrawerController.toggleDrawer();
  //                       },
  //                       trailing: Icon(Icons.account_circle_rounded),
  //                       title: Text('Profile'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.favorite),
  //                       title: Text('Favourites'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.settings),
  //                       title: Text('Settings'),
  //                     ),
  //                   ],
  //                 ),
  //                 ExpansionTile(
  //                   title: Text('Profile'),
  //                   leading: Icon(Icons.account_circle_rounded),
  //                   children: [
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.home),
  //                       title: Text('Home'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.account_circle_rounded),
  //                       title: Text('Profile'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.favorite),
  //                       title: Text('Favourites'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.settings),
  //                       title: Text('Settings'),
  //                     ),
  //                   ],
  //                 ),
  //                 ExpansionTile(
  //                   title: Text('Favourites'),
  //                   leading: Icon(Icons.favorite),
  //                   children: [
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.home),
  //                       title: Text('Home'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.account_circle_rounded),
  //                       title: Text('Profile'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.favorite),
  //                       title: Text('Favourites'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.settings),
  //                       title: Text('Settings'),
  //                     ),
  //                   ],
  //                 ),
  //                 ExpansionTile(
  //                   title: Text('Settings'),
  //                   leading: Icon(Icons.settings),
  //                   children: [
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.home),
  //                       title: Text('Home'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.account_circle_rounded),
  //                       title: Text('Profile'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.favorite),
  //                       title: Text('Favourites'),
  //                     ),
  //                     ListTile(
  //                       onTap: () {},
  //                       trailing: Icon(Icons.settings),
  //                       title: Text('Settings'),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  final _drawerController = DrawerScaffoldController();

  Widget headerView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
          Divider(
            color: Theme.of(context).dividerColor,
            height: 20,
          )
        ],
      ),
    );
  }

  var selectedMenuItemId = 'My Account';
  var _widget = Text("1");

  var menu;

  @override
  Widget build(BuildContext context) {
    menu = Menu(
      items: [
        new MenuItem(
          id: 'My Account',
          title: 'My Account',
          suffix: Icon(Icons.person_outline),
          data: [
            ListTile(
              onTap: () {
                setState(() => _widget = Text("Home.1"));

                _drawerController.toggle();
              },
              trailing: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              onTap: () {
                setState(() => _widget = Text("Profile.1"));
                _drawerController.toggle();
              },
              trailing: Icon(Icons.account_circle_rounded),
              title: Text('Profile'),
            )
          ],
        ),
        new MenuItem(
          id: 'Settings',
          title: 'Settings',
          suffix: Icon(Icons.settings),
          data: [
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.favorite),
              title: Text('Favourites'),
            ),
            ListTile(
              onTap: () {},
              trailing: Icon(Icons.settings),
              title: Text('Settings'),
            )
          ],
        ),
      ],
    );
    return DrawerScaffold(
      controller: _drawerController,
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
          selectorColor: Theme.of(context).primaryColor,
          /////////////////////////////
          itemBuilder:
              (BuildContext context, MenuItem menuItem, bool isSelected) {
            return ExpansionTile(
                title: Text('${menuItem.title}'),
                leading: Icon(Icons.home),
                children: menuItem.data);
          },
          //////////////////////////
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
              } else {
                setState(() => _widget = Text("Logout"));
              }
            });
          },
        ),
      ],
      builder: (context, id) => Center(
        child: _widget,
      ),
    );
  }
}
