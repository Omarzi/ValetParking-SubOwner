import 'package:meta/meta.dart';
import 'package:valetparking_subowner/features/auth/models/sub_owner_data_model.dart';
import 'package:valetparking_subowner/utils/constants/api_constants.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';
import 'package:valetparking_subowner/utils/dio/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  SubOwnerDataModel subOwnerDataModel = SubOwnerDataModel();

  /// Login Function
  Future<void> loginFunction({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final response =
          await dioHelper.postData(endPoint: ApiConstants.loginUrl, body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        emit(LoginSuccessState(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(LoginErrorState(message: response.data['message'] ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(LoginErrorState(message: 'Error in login'));
      }
    } catch (error) {
      logError(error.toString());
      emit(LoginErrorState(message: error.toString()));
    }
  }

  /// Verify Reset Code Function
  Future<void> verifyResetCodeFunction({
    required String resetCode,
  }) async {
    emit(VerifyResetPasswordLoadingState());
    try {
      final response = await dioHelper.postData(
        endPoint: ApiConstants.verifyResetCodeOfLoginUrl,
        body: {
          'resetCode': resetCode,
        },
      );

      if (response.statusCode == 200) {
        // logSuccess(response.data.toString());
        // subOwnerDataModel = SubOwnerDataModel.fromJson(response.data);

        await VCacheHelper.putString(
          key: CacheKeys.userId,
          value: response.data['adminData']['adminId'],
        );
        await VCacheHelper.putString(
          key: CacheKeys.token,
          value: response.data['token'],
        );
        await VCacheHelper.putString(
          key: CacheKeys.role,
          value: response.data['adminData']['role'],
        );
        await VCacheHelper.putString(
          key: CacheKeys.email,
          value: response.data['adminData']['email'],
        );

        emit(VerifyResetPasswordSuccessState(message: response.data['message']));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(VerifyResetPasswordErrorState(
            message: response.data['message']?.toString() ?? ''));
      } else {
        logError(response.data['message'].toString());
        emit(VerifyResetPasswordErrorState(message: 'Error in forget password'));
      }
    } catch (error) {
      logError(error.toString());
      emit(VerifyResetPasswordErrorState(message: error.toString()));
    }
  }


}
