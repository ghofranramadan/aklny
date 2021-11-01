import 'package:aklny/widgets/drawer_items.dart';
import 'package:aklny/widgets/drawer_page.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
          DrawerItems(),
          WillPopScope(
            onWillPop: () async {
              if (isDrawerOpen) {
                closeDrawer();
                return false;
              } else {
                return true;
              }
            },
            child: GestureDetector(
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
                    child: DrawerPage(
                      openDrawer: openDrawer,
                      widget: _widget,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
