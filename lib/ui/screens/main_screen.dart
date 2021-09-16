import 'package:aklny/ui/screens/cart_screen.dart';
import 'package:aklny/ui/screens/categories_screen.dart';
import 'package:aklny/ui/screens/home_screen.dart';
import 'package:aklny/ui/screens/offers_screen.dart';
import 'package:aklny/ui/screens/profile_screen.dart';
import 'package:aklny/ui/widgets/buttom_widget.dart';
import 'package:aklny/ui/widgets/custom_paint_shape.dart';
import 'package:aklny/utils/vars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _buildScreens[selectedIndex],
      bottomNavigationBar: Container(
        width: size.width,
        height: 80,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              child: CustomPaint(
                size: Size(size.width, 80),
                painter: BNBCustomPainter(
                  context: context,
                ),
              ),
            ),
            Center(
              heightFactor: 0.45,
              child: GestureDetector(
                onTap: () {
                  selectedTab(2);
                },
                behavior: HitTestBehavior.opaque,
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 70,
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
            ),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                    svgPic: 'assets/svg/indent.svg',
                    title: tr('more'),
                    onTap: () => selectedTab(4),
                    selected: selectedIndex == 4 ? true : false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
