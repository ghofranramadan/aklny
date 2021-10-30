import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            style:
                                Theme.of(context).textTheme.headline3.copyWith(
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
                      // setState(() => _widget = Text("Home.1"));
                      // _advancedDrawerController.toggleDrawer();
                    },
                    trailing: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  ListTile(
                    onTap: () {
                      // setState(() => _widget = Text("Profile.1"));
                      // _advancedDrawerController.toggleDrawer();
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
    );
  }
}
