import 'package:aklny/ui/screens/create_account_screen.dart';
import 'package:aklny/utils/vars.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'login_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  CarouselController buttonCarouselController = CarouselController();

  List<Widget> welcome = [
    FirstIntroWidget(),
    SecondIntroWidget(),
    ThirdIntroWidget()
  ];
  int indicatorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          top: (MediaQuery.of(context).size.height * 35) / 812,
        ),
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            indicatorIndex == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          buttonCarouselController.animateToPage(2);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width * 80) / 375,
                          child: Text(
                            tr('skip'),
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
            Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.75,
                      enableInfiniteScroll: false,
                      disableCenter: true,
                      viewportFraction: 1,
                      aspectRatio: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          indicatorIndex = index;
                        });
                      }),
                  itemCount: welcome.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FittedBox(
                      child: welcome[index],
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.55,
                  child: DotsIndicator(
                    dotsCount: welcome.length,
                    mainAxisSize: MainAxisSize.max,
                    position: indicatorIndex.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: Theme.of(context).primaryColor,
                      color: Theme.of(context).buttonColor,
                      spacing: EdgeInsets.only(left: 6),
                      size: const Size.fromRadius(5.5),
                      activeSize: const Size(24, 5),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                    ),
                  ),
                ),
              ],
            ),
            indicatorIndex == 0 || indicatorIndex == 1
                ? GestureDetector(
                    onTap: () {
                      buttonCarouselController.nextPage();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: (MediaQuery.of(context).size.height * 45) / 812,
                      ),
                      alignment: Alignment.center,
                      height: (MediaQuery.of(context).size.height * 53) / 812,
                      width: (MediaQuery.of(context).size.width * 258) / 375,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.65),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(tr('next'),
                          style: Theme.of(context).textTheme.headline3),
                    ),
                  )
                :                       GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              ),
              behavior: HitTestBehavior.opaque,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  bottom:
                  (MediaQuery.of(context).size.height * 20) / 812,
                ),
                height:
                (MediaQuery.of(context).size.height * 53) / 812,
                width:
                (MediaQuery.of(context).size.width * 258) / 375,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .primaryColor
                      .withOpacity(0.65),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(tr('continue'),
                    style: Theme.of(context).textTheme.headline3),
              ),
            ),

            // Column(
            //         children: [
            //           GestureDetector(
            //             onTap: () => Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (context) {
            //                   return LoginScreen();
            //                 },
            //               ),
            //             ),
            //             behavior: HitTestBehavior.opaque,
            //             child: Container(
            //               alignment: Alignment.center,
            //               margin: EdgeInsets.only(
            //                 bottom:
            //                     (MediaQuery.of(context).size.height * 20) / 812,
            //               ),
            //               height:
            //                   (MediaQuery.of(context).size.height * 53) / 812,
            //               width:
            //                   (MediaQuery.of(context).size.width * 258) / 375,
            //               decoration: BoxDecoration(
            //                 color: Theme.of(context)
            //                     .primaryColor
            //                     .withOpacity(0.65),
            //                 borderRadius: BorderRadius.circular(25),
            //               ),
            //               child: Text(tr('login'),
            //                   style: Theme.of(context).textTheme.headline3),
            //             ),
            //           ),
            //           GestureDetector(
            //             onTap: () => Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (context) {
            //                   return CreateAccountScreen();
            //                 },
            //               ),
            //             ),
            //             behavior: HitTestBehavior.opaque,
            //             child: Container(
            //               margin: EdgeInsets.only(
            //                 bottom:
            //                     (MediaQuery.of(context).size.height * 20) / 812,
            //               ),
            //               alignment: Alignment.center,
            //               height:
            //                   (MediaQuery.of(context).size.height * 30) / 812,
            //               width:
            //                   (MediaQuery.of(context).size.width * 258) / 375,
            //               decoration: BoxDecoration(),
            //               child: Text(tr('create_an_account'),
            //                   style: Theme.of(context).textTheme.headline4),
            //             ),
            //           )
            //         ],
            //       ),
          ],
        ),
      ),
    );
  }
}

class FirstIntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/svg/Find food you love vector.svg',
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height * 45) / 812,
        ),
        Text(
          tr('find_food_you_love'),
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontFamily: 'CopperplateGothic',
              fontSize: 28,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height * 30) / 812,
        ),
        Container(
          width: 275,
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Text(
            tr('discover'),
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 10,
                ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}

class SecondIntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/svg/Delivery vector.svg',
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height * 45) / 812,
        ),
        Text(
          tr('fast_delivery'),
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontFamily: 'CopperplateGothic',
              fontSize: 28,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height * 30) / 812,
        ),
        Container(
          width: 271,
          padding: EdgeInsets.symmetric(
            horizontal: 45,
          ),
          child: Text(
            tr('delivery'),
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 10,
                ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}

class ThirdIntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/svg/Live tracking vector.svg',
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height * 45) / 812,
        ),
        Text(
          tr('live_tracking'),
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontFamily: 'CopperplateGothic',
              fontSize: 28,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: (MediaQuery.of(context).size.height * 30) / 812,
        ),
        Container(
          width: 271,
          padding: EdgeInsets.symmetric(
            horizontal: 45,
          ),
          child: Text(
            tr('tracking'),
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 10,
                ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
