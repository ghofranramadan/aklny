import 'dart:async';

import 'package:aklny/api/api.dart';
import 'package:aklny/api/api_connect.dart';
import 'package:aklny/model/categories_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial());

  // List<DataOfCategory> categories = [];
  CategoryModel categories;

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if (event is FetchCategories) {
      yield* fetchCategories(event);
    }
  }

  Stream<CategoriesState> fetchCategories(FetchCategories event) async* {
    try {
      yield CategoriesLoading();
      // categories = [];
      var response = await ApiProvider.getApiData(url: '${API.CATEGORIES}');
      if (ApiProvider.validResponse(response.statusCode)) {
        // response.data["data"]["data"].forEach((e) {
        //   banners.add(BannerModel.fromJson(e));
        // });
        categories = CategoryModel.formJson(response.data);
        // print(response.data);

        yield CategoriesSuccess(category: categories);
      } else {
        yield CategoriesError();
      }
    } catch (e) {
      print("Error ==> $e");
      yield CategoriesError();
    }
  }

  // Stream<CategoriesState> fetchCategories(FetchCategories event) async* {
  //   try {
  //     yield CategoriesLoading();
  //     var response =
  //         await Dio().get('https://student.valuxapps.com/api/categories');
  //     if (response.statusCode == 200) {
  //       print(response.data);
  //       response.data["data"]["data"].forEach((e) {
  //         category.add(Category.fromJson(e));
  //       });
  //       yield CategoriesSuccess(category: category);
  //     } else {
  //       yield CategoriesError();
  //     }
  //   } catch (e) {
  //     print("Error ==> $e");
  //     yield CategoriesError();
  //   }
  // }
}
