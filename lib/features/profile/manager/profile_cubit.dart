import 'package:meta/meta.dart';
import 'package:valetparking_subowner/features/auth/models/sub_owner_data_model.dart';
import 'package:valetparking_subowner/features/profile/models/sub_owner_profile_data_model.dart';
import 'package:valetparking_subowner/utils/constants/api_constants.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';
import 'package:valetparking_subowner/utils/dio/dio_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  SubOwnerProfileDataModel subOwnerProfileDataModel = SubOwnerProfileDataModel();

  Future<void> getProfileDataFunction() async {
    emit(GetProfileDataLoadingState());
    try {
      final userId = VCacheHelper.getString(key: CacheKeys.userId);

      final response = await dioHelper.getData(
        endPoint: '${ApiConstants.profileDataUrl}$userId',
      );

      if (response.statusCode == 200) {
        subOwnerProfileDataModel = SubOwnerProfileDataModel.fromJson(response.data);
        emit(GetProfileDataSuccessState());
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetProfileDataErrorState(message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      logError(
          '${ApiConstants.baseUrl}${ApiConstants.profileDataUrl}${VCacheHelper.getString(key: CacheKeys.userId)}');
      emit(GetProfileDataErrorState(message: error.toString()));
    }
  }
}
