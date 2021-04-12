import 'package:aklny/ui/screens/cart_screen.dart';
import 'package:aklny/ui/screens/categories_screen.dart';
import 'package:aklny/ui/screens/home_screen.dart';
import 'package:aklny/ui/screens/offers_screen.dart';
import 'package:aklny/ui/screens/profile_screen.dart';
import 'package:aklny/ui/widgets/buttom_widget.dart';
import 'package:aklny/utils/vars.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shadow/shadow.dart';
import 'package:easy_localization/easy_localization.dart';

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
                  BottomWidget(
                    svgPic: 'assets/svg/house.svg',
                    title: tr('home'),
                    onTap: () => selectedTab(0),
                    selected: selectedIndex == 0 ? true : false,
                  ),
                  BottomWidget(
                    svgPic: 'assets/svg/categories.svg',
                    title: tr('categories'),
                    onTap: () => selectedTab(1),
                    selected: selectedIndex == 1 ? true : false,
                    padding: EdgeInsets.only(
                      right: GetLAng?.lang == 'en_US' ?? true ? 30 : 40,
                    ),
                  ),
                  BottomWidget(
                    svgPic: 'assets/svg/shopping-bag.svg',
                    title: tr('offers'),
                    onTap: () => selectedTab(3),
                    selected: selectedIndex == 3 ? true : false,
                    padding: EdgeInsets.only(
                      left: GetLAng?.lang == 'en_US' ?? true ? 30 : 0,
                      right: GetLAng?.lang == 'en_US' ?? true ? 0 : 80,
                    ),
                  ),
                  BottomWidget(
                    svgPic: 'assets/svg/avatar.svg',
                    title: tr('profile'),
                    onTap: () => selectedTab(4),
                    selected: selectedIndex == 4 ? true : false,
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
