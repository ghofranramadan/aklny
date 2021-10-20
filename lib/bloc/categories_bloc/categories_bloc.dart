import 'dart:async';

import 'package:aklny/model/categories.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial());

  List<Category> category = [];

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if (event is FetchCategories) {
      // yield* fetchCategories(event);
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
