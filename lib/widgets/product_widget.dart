import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius:
        BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: Image(
                  image: NetworkImage(
                      'https://image.freepik.com/free-vector/shopping-online-store-via-mobile-phone-bags-shopping-cart-gift-boxes-standing-upon-podium_181870-168.jpg'),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
              // cubit.home.data.products[index]
              //     .discount ==
              //     0
              //     ? SizedBox()
              //     :
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  color: Colors.red,
                ),
                child: Text(
                  'Discount',
                  style: Theme.of(context)
                      .textTheme
                      .headline3,
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 7, vertical: 3),
              )
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'product name',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      height: 2),
                ),
                Row(
                  children: [
                    Text(
                      '1000',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // SizedBox(
                    //   width: 14,
                    // ),
                    // cubit.home.data.products[index]
                    //     .discount ==
                    //     0
                    //     ? SizedBox()
                    //     :
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      child: Text(
                        '1300',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(
                            fontWeight:
                            FontWeight.w500,
                            fontSize: 14,
                            decorationThickness: 1.5,
                            decorationColor:
                            Colors.red,
                            decorationStyle:
                            TextDecorationStyle
                                .solid,
                            decoration: TextDecoration
                                .lineThrough),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          // cubit.addToFav(cubit
                          //     .home
                          //     .data
                          //     .products[index]
                          //     .id);
                        },
                        icon:
                        // cubit.favorites[cubit
                        //     .home
                        //     .data
                        //     .products[index]
                        //     .id]
                        //     ? Icon(
                        //   Icons.favorite,
                        //   color: Theme.of(
                        //       context)
                        //       .primaryColor,
                        // )
                        //     :
                        Icon(Icons.favorite_border))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
