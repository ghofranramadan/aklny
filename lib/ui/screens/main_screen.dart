import 'package:aklny/ui/widgets/fab_bottom_app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shadow/shadow.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FABBottomAppBarState ani = new FABBottomAppBarState();
  bool cartIsTrue = false;
  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: Center(
            child: Text(
              _lastSelected,
              style: TextStyle(fontSize: 32.0),
            ),
          ),
        ),
        bottomNavigationBar: Shadow(
          offset: Offset(0, -7),
          opacity: 0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16)),
            child: FABBottomAppBar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
              centerItemText: '',
              color: Theme.of(context).shadowColor,
              selectedColor: Theme.of(context).indicatorColor,
              notchedShape: CircularNotchedRectangle(),
              onTabSelected: _selectedTab,
              items: [
                FABBottomAppBarItem(
                    iconData: 'assets/svg/house.svg', text: 'Home'),
                FABBottomAppBarItem(
                    iconData: 'assets/svg/ic_dashboard_24px.svg',
                    text: 'Categories'),
                FABBottomAppBarItem(
                    iconData: 'assets/svg/shopping-bag.svg', text: 'Offers'),
                FABBottomAppBarItem(
                    iconData: 'assets/svg/avatar.svg', text: 'Profile'),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onTap: () async {
            cartIsTrue = true;
            setState(() {});
            ani.cartIsTrue = true;
            await ani.knowingSelection();
            _selectedTab(4);
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
              color: cartIsTrue == false
                  ? Theme.of(context).shadowColor
                  : Theme.of(context).indicatorColor,
              width: 32,
              height: 32,
            ),
          ),
        ));
  }
}
