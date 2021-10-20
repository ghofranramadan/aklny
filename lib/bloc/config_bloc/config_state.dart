part of 'config_bloc.dart';

@immutable
abstract class ConfigState {}

class ConfigInitial extends ConfigState {}

class BannersLoading extends ConfigState {}

class BannersSuccess extends ConfigState {
  final List<BannerModel> banners;
  BannersSuccess({this.banners});
}

class BannersError extends ConfigState {}
