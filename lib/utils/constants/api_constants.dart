class ApiConstants {
  // static const baseUrl = 'http://192.168.100.27:8080/';
  static const baseUrl = 'https://valet-parking-back-end-production.up.railway.app/';
  // static const baseUrl = 'http://192.168.1.12:8080/';

  static const loginUrl = 'owner/login';
  static const verifyResetCodeOfLoginUrl = 'owner/verifyResetCode';
  static const verifyOTPUrl = 'api/user/login';
  static const fillYourAccountUrl = 'api/user/register';
  static const countryUrl = 'api/country';
  static const cityUrl = 'api/city';
  static const makeScanUrl = 'driver/makeScan';
  static const servicesUrl = 'api/service';
  static const allOffersUrl = 'api/user/offer';
  static const getAllAddressesUrl = 'api/user/location';
  static const subServiceUrl = 'api/sub_service';
  static const orderUrl = 'api/user/order';
  static const getAllDriversUrl = 'subOwner/getAllAdmin';
  static const faqCategoryUrl = 'api/faq-category';
  static const faqIndexUrl = 'api/faq';
  static const getProfileDataUrl = 'api/user/profile';
  static const profileDataUrl = 'driver/getPofileOfAdmin/';
  // static const getAllOrdersUrl = 'driver/getAllOrderBySpecificGarage';
  static const customerServicesUrl = 'api/ticket';
  static const getSpecificOrderUrl = 'subOwner/getOrder/';
  static const getAllOrdersUrl = 'subOwner/getAllOrders';
  static const getAttendanceInStartUrl = 'subOwner/getAttendanceStartIn';
  static const getAttendanceEndInUrl = 'subOwner/getAttendanceEndIn';
}