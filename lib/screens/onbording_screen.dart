import 'package:aklny/screens/signup_screen.dart';
import 'package:aklny/utils/components.dart';
import 'package:aklny/widgets/onboarding_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  CarouselController buttonCarouselController = CarouselController();
  List<Widget> welcome = [
    OnBoarding(
      picture: 'assets/images/Group 10596.png',
      title: 'best_offers',
      subTitle: 'discover',
    ),
    OnBoarding(
      picture: 'assets/images/Group 784.png',
      title: 'electronic_payment',
      subTitle: 'delivery',
    ),
    OnBoarding(
      picture: 'assets/images/MOTO.png',
      title: 'live_tracking',
      subTitle: 'tracking',
    ),
  ];
  int indicatorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: (MediaQuery.of(context).size.height * 35) / 812,
        ),
        child: Column(
          children: [
            indicatorIndex == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return CreateAccountScreen();
                            },
                          ),
                        ),
                        child: Container(
                          height: 30,
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
                : SizedBox(
                    height: 30,
                  ),
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
                  itemBuilder: (BuildContext context, int index, int i) {
                    return welcome[index];
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.56,
                  child: DotsIndicator(
                    dotsCount: welcome.length,
                    mainAxisSize: MainAxisSize.max,
                    position: indicatorIndex.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: Theme.of(context).primaryColor,
                      color: Theme.of(context).highlightColor,
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
            Spacer(),
            indicatorIndex == 0 || indicatorIndex == 1
                ? customButton(
                    context: context,
                    onTap: () {
                      buttonCarouselController.nextPage();
                    },
                    text: Text(tr('next'),
                        style: Theme.of(context).textTheme.headline3),
                  )
                : customButton(
                    context: context,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return CreateAccountScreen();
                        },
                      ),
                    ),
                    text: Text(tr('continue'),
                        style: Theme.of(context).textTheme.headline3),
                  ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 20) / 812,
            )
          ],
        ),
      ),
    );
  }
}
