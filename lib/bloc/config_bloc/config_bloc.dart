import 'package:aklny/api/api.dart';
import 'package:aklny/api/api_connect.dart';
import 'package:aklny/model/banner_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(ConfigInitial()) {}
  List<BannerModel> banners = <BannerModel>[];

  @override
  Stream<ConfigState> mapEventToState(ConfigEvent event) async* {
    if (event is FetchBanners) {
      yield* fetchBanners(event);
    }
  }

  Stream<ConfigState> fetchBanners(ConfigEvent event) async* {
    try {
      yield BannersLoading();
      banners = [];
      var response = await ApiProvider.getApiData(url: '${API.BANNERS}');
      if (ApiProvider.validResponse(response.statusCode)) {
        response.data["data"].forEach((e) {
          banners.add(BannerModel.fromJson(e));
        });
        yield BannersSuccess(banners: banners);
      } else {
        yield BannersError();
      }
    } catch (e) {
      print("Error ==> $e");
      yield BannersError();
    }
  }
}
