part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final CategoryModel category;
  CategoriesSuccess({this.category});
}

class CategoriesError extends CategoriesState {}
