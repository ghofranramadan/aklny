import 'package:aklny/ui/screens/cart_screen.dart';
import 'package:aklny/ui/screens/categories_screen.dart';
import 'package:aklny/ui/screens/home_screen.dart';
import 'package:aklny/ui/screens/offers_screen.dart';
import 'package:aklny/ui/screens/profile_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shadow/shadow.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> _buildScreens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    OffersScreen(),
    ProfileScreen(),
  ];

  void selectedTab(int index) {
    if (mounted)
      setState(() {
        selectedIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _buildScreens[selectedIndex],
      bottomNavigationBar: Shadow(
        offset: Offset(0, -7),
        opacity: 0.5,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16)),
          child: BottomAppBar(
            notchMargin: 10,
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            shape: CircularNotchedRectangle(),
            child: Container(
              alignment: Alignment.center,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      selectedTab(0);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/svg/house.svg',
                          width: 24,
                          height: 24,
                          color: selectedIndex == 0
                              ? Theme.of(context).indicatorColor
                              : Theme.of(context).shadowColor,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Home',
                          style: selectedIndex == 0
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
                  Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        selectedTab(1);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/svg/categories.svg',
                            width: 24,
                            height: 24,
                            color: selectedIndex == 1
                                ? Theme.of(context).indicatorColor
                                : Theme.of(context).shadowColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Categories',
                            style: selectedIndex == 1
                                ? Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        selectedTab(3);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/svg/shopping-bag.svg',
                            width: 24,
                            height: 24,
                            color: selectedIndex == 3
                                ? Theme.of(context).indicatorColor
                                : Theme.of(context).shadowColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Offers',
                            style: selectedIndex == 3
                                ? Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      selectedTab(4);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/svg/avatar.svg',
                          width: 24,
                          height: 24,
                          color: selectedIndex == 4
                              ? Theme.of(context).indicatorColor
                              : Theme.of(context).shadowColor,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Profile',
                          style: selectedIndex == 4
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
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          selectedTab(2);
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor.withOpacity(0.8)),
          child: SvgPicture.asset(
            "assets/svg/shopping-cart.svg",
            color: selectedIndex == 2
                ? Theme.of(context).indicatorColor
                : Theme.of(context).shadowColor,
            width: 32,
            height: 32,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
