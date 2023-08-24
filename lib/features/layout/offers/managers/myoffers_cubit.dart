import 'package:bella/features/auth/data/data_provider/local/cach_keys.dart';
import 'package:bella/features/auth/data/data_provider/local/cache.dart';
import 'package:bella/features/auth/data/data_provider/remote/dio_helper.dart';
import 'package:bella/features/layout/offers/data/get_all_personal_offers_by_user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'myoffers_state.dart';

class MyoffersCubit extends Cubit<MyoffersState> {
  MyoffersCubit() : super(MyoffersInitialState());

  DioHelper dioHelper = DioHelper();

  GetAllPersonalOffersByUserModel? getAllPersonalOffersByUserModel;

  static MyoffersCubit get(context) => BlocProvider.of(context);

  Future<void> getAllPersonalOffersByUsers({String? companyId = ''}) async {
    emit(GetAllPersonalOffersByUsersLoadingState());
    await dioHelper
        .getData(
            endPoint: companyId! == ''
                ? 'api/v1/personal_offers/${MyCache.getString(key: CacheKeys.userId)}'
                : 'api/v1/personal_offers/${MyCache.getString(key: CacheKeys.userId)}?company_id=${MyCache.getString(key: CacheKeys.comp_id)}')
        .then((value) {
      getAllPersonalOffersByUserModel =
          GetAllPersonalOffersByUserModel.fromJson(value.data);
      emit(GetAllPersonalOffersByUsersSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetAllPersonalOffersByUsersErrorState());
    });
  }
}
