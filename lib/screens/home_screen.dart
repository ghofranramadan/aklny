import 'package:aklny/bloc/categories_bloc/categories_bloc.dart';
import 'package:aklny/bloc/config_bloc/config_bloc.dart';
import 'package:aklny/model/banner_model.dart';
import 'package:aklny/model/categories_model.dart';
import 'package:aklny/utils/components.dart';
import 'package:aklny/utils/vars.dart';
import 'package:aklny/widgets/category_widget.dart';
import 'package:aklny/widgets/product_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int indicatorIndex = 0;
  String search = '';
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ConfigBloc>(context).add(FetchBanners());
    BlocProvider.of<CategoriesBloc>(context).add(FetchCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 20 / 375,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello , Guest',
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    customTextField(
                      context: context,
                      onSaved: (value) {
                        setState(() {
                          search = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          search = value;
                        });
                      },
                      hintText: 'Search',
                      keyboardType: TextInputType.text,
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 24,
                        maxWidth: 59,
                      ),
                      suffixIconConstraints: BoxConstraints(
                        maxHeight: 40,
                        maxWidth: 50,
                      ),
                      suffixIcon: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 46,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).cardColor),
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(4),
                          child: SvgPicture.asset(
                            'assets/svg/setting-lines.svg',
                            color: Colors.black,
                            height: 24,
                            width: 24,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      prefixIcon: Container(
                        padding: EdgeInsets.only(
                          left: GetLAng?.lang == 'en_US' ?? true ? 20 : 15,
                          right: GetLAng?.lang == 'en_US' ?? true ? 15 : 20,
                        ),
                        child: SvgPicture.asset(
                          'assets/svg/Group 6821.svg',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    BlocConsumer<ConfigBloc, ConfigState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is BannersLoading) {
                          return Center(
                              child: const CircularProgressIndicator());
                        } else if (state is BannersSuccess) {
                          List<BannerModel> banners = state.banners;
                          return Column(
                            children: [
                              CarouselSlider.builder(
                                carouselController: buttonCarouselController,
                                options: CarouselOptions(
                                    height: MediaQuery.of(context).size.height *
                                        0.30,
                                    enableInfiniteScroll: false,
                                    disableCenter: true,
                                    viewportFraction: 1,
                                    aspectRatio: 1,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        indicatorIndex = index;
                                      });
                                    }),
                                itemCount: banners.length,
                                itemBuilder:
                                    (BuildContext context, int index, int i) {
                                  return ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    child: Image(
                                      image: NetworkImage(
                                        '${banners[index].image}',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DotsIndicator(
                                dotsCount: banners.length,
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
                            ],
                          );
                        } else {
                          return Center(child: Text("Error"));
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tr('categories'),
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                        ),
                        Text(
                          tr('see_all'),
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              BlocConsumer<CategoriesBloc, CategoriesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return Center(child: const CircularProgressIndicator());
                  } else if (state is CategoriesSuccess) {
                    List<DataOfCategory> categories =
                        state.category.data.dataOfCategory;
                    return Container(
                      height: 160,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          padding: EdgeInsets.only(
                            bottom: 20,
                            right: GetLAng?.lang == 'en_US' ?? true ? 0 : 22,
                            left: GetLAng?.lang == 'en_US' ?? true ? 22 : 0,
                          ),
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 17,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return CategoryWidget(
                              image: "${categories[index].image}",
                              name: "${categories[index].name}",
                            );
                          }),
                    );
                  } else {
                    return Center(child: Text("Error"));
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 22 / 375,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr('products'),
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GridView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing:
                              (MediaQuery.of(context).size.width * 10) / 375,
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1 / 1.66,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return ProductWidget();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
