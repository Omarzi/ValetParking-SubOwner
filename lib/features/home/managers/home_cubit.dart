import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:valetparking_subowner/features/home/models/get_all_drivers_model.dart';
import 'package:valetparking_subowner/features/home/models/get_all_orders_in_all_garages_model.dart';
import 'package:valetparking_subowner/features/home/models/get_attendance_in_start_response_model.dart';
import 'package:valetparking_subowner/features/home/models/get_specific_order_model.dart';
import 'package:valetparking_subowner/utils/constants/api_constants.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';
import 'package:valetparking_subowner/utils/dio/dio_helper.dart';
import 'package:intl/intl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  GetAllDriversModel getAllDriversModel = GetAllDriversModel();
  GetOrdersInAllGaragesModel getOrdersInAllGaragesModel =
      GetOrdersInAllGaragesModel();
  GetSpecificOrderModel getSpecificOrderModel = GetSpecificOrderModel();
  GetAttendanceInStartResponseModel getAttendanceInStartResponseModel =
      GetAttendanceInStartResponseModel();

  Future<void> getAllDriversFunction() async {
    emit(GetAllDriversLoadingModel());
    try {
      final response = await dioHelper.getData(
        endPoint: '${ApiConstants.getAllDriversUrl}?role=Driver',
      );

      if (response.statusCode == 200) {
        getAllDriversModel = GetAllDriversModel.fromJson(response.data);
        emit(GetAllDriversSuccessModel(
            message: response.data['message'].toString()));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        logError(response.data['message'].toString());
        emit(GetAllDriversErrorModel(
            message: response.data['message'].toString()));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetAllDriversErrorModel(message: error.toString()));
    }
  }

  // Future<void> getAllOrdersInAllGarageFunction({String? status}) async {
  //   try {
  //     /// Build the query parameters dynamically based on the presence of status and garageId
  //     String queryParameters = '';
  //
  //     if (status != null) {
  //       if (queryParameters.isNotEmpty) {
  //         queryParameters += '&';
  //       }
  //       queryParameters += 'status=$status';
  //     }
  //
  //     /// Construct the final endpoint with query parameters (if any)
  //     final endPoint = queryParameters.isNotEmpty
  //         ? '${ApiConstants.getAllOrdersUrl}?$queryParameters'
  //         : ApiConstants.getAllOrdersUrl;
  //
  //     final response = await dioHelper.getData(endPoint: endPoint);
  //
  //     if (response.statusCode == 200) {
  //       getOrdersInAllGaragesModel = GetOrdersInAllGaragesModel.fromJson(response.data);
  //       emit(GetAllOrdersInAllGaragesSuccessState(message: 'Get all Orders successfully'));
  //     } else if (response.statusCode == 422 || response.statusCode == 404) {
  //       emit(GetAllOrdersInAllGaragesErrorState(message: response.data['message'] ?? ''));
  //     }
  //   } catch (error) {
  //     logError(error.toString());
  //     emit(GetAllOrdersInAllGaragesErrorState(message: error.toString()));
  //   }
  // }

  Future<void> getAllOrdersInAllGarageFunction({
    String? status,
    DateTime? dateGte,
    DateTime? dateLte,
  }) async {
    try {
      // Initialize query parameters string
      String queryParameters = '';

      // Add status to query parameters if present
      if (status != null) {
        if (queryParameters.isNotEmpty) {
          queryParameters += '&';
        }
        queryParameters += 'status=$status';
      }

      // Date formatting to 'YYYY-MM-DD'
      final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

      // Add dateGte to query parameters if present
      if (dateGte != null) {
        if (queryParameters.isNotEmpty) {
          queryParameters += '&';
        }
        queryParameters += 'dateGte=${dateFormat.format(dateGte)}';
      }

      // Add dateLte to query parameters if present
      if (dateLte != null) {
        if (queryParameters.isNotEmpty) {
          queryParameters += '&';
        }
        queryParameters += 'dateLte=${dateFormat.format(dateLte)}';
      }

      // Construct the final endpoint with query parameters (if any)
      final endPoint = queryParameters.isNotEmpty
          ? '${ApiConstants.getAllOrdersUrl}?$queryParameters'
          : ApiConstants.getAllOrdersUrl;

      // Fetch data from API
      final response = await dioHelper.getData(endPoint: endPoint);

      if (response.statusCode == 200) {
        getOrdersInAllGaragesModel =
            GetOrdersInAllGaragesModel.fromJson(response.data);
        emit(GetAllOrdersInAllGaragesSuccessState(
            message: 'Get all Orders successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetAllOrdersInAllGaragesErrorState(
            message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetAllOrdersInAllGaragesErrorState(message: error.toString()));
    }
  }

  Future<void> getSpecificFunction(
      {required String status, required String orderId}) async {
    emit(GetSpecificOrderLoadingState());
    try {
      final response = await dioHelper.getData(
        endPoint: '${ApiConstants.getSpecificOrderUrl}$orderId',
      );

      if (response.statusCode == 200) {
        getSpecificOrderModel = GetSpecificOrderModel.fromJson(response.data);
        emit(GetSpecificOrderSuccessState(
            message: 'Get specific Order successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetSpecificOrderErrorState(
            message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetSpecificOrderErrorState(message: error.toString()));
    }
  }

  Future<void> getAttendanceInStartFunction(
      {required String createdAtGTE, required String createdAtLTE}) async {
    emit(GetAttendanceInStartLoadingState());
    try {
      final response = await dioHelper.getData(
        endPoint:
            '${ApiConstants.getAttendanceInStartUrl}?createdAt[gte]=$createdAtGTE&createdAt[lte]=$createdAtLTE',
      );

      if (response.statusCode == 200) {
        getAttendanceInStartResponseModel =
            GetAttendanceInStartResponseModel.fromJson(response.data);
        emit(GetAttendanceInStartSuccessState(
            message: 'Get specific Order successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetAttendanceInStartErrorState(
            message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetAttendanceInStartErrorState(message: error.toString()));
    }
  }

  Future<void> getAttendanceInEndFunction(
      {required String createdAtGTE, required String createdAtLTE}) async {
    emit(GetAttendanceInStartLoadingState());
    try {
      final response = await dioHelper.getData(
        endPoint:
        '${ApiConstants.getAttendanceEndInUrl}?endIn[gte]=$createdAtGTE&endIn[lte]=$createdAtLTE',
      );

      if (response.statusCode == 200) {
        getAttendanceInStartResponseModel =
            GetAttendanceInStartResponseModel.fromJson(response.data);
        emit(GetAttendanceInStartSuccessState(
            message: 'Get specific Order successfully'));
      } else if (response.statusCode == 422 || response.statusCode == 404) {
        emit(GetAttendanceInStartErrorState(
            message: response.data['message'] ?? ''));
      }
    } catch (error) {
      logError(error.toString());
      emit(GetAttendanceInStartErrorState(message: error.toString()));
    }
  }
}
