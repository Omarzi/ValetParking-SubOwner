import 'package:url_launcher/url_launcher.dart';
import 'package:valetparking_subowner/features/home/managers/home_cubit.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';

class ParkingTicketScreen extends StatefulWidget {
  const ParkingTicketScreen({super.key, required this.orderId});

  final String orderId;

  @override
  State<ParkingTicketScreen> createState() => _ParkingTicketScreenState();
}

class _ParkingTicketScreenState extends State<ParkingTicketScreen> {
  @override
  void initState() {
    HomeCubit.get(context)
        .getSpecificFunction(status: 'ongoing', orderId: widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var getSpecificOrderCubit = HomeCubit.get(context);

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: VColors.whiteColor,
                  title: Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Text(
                      '${AppLocalizations.of(context)!.translate('parkingTicket')}',
                      style: VStyles.h4Bold(context),
                    ),
                  ),
                  leading: null,
                  floating: true,
                  pinned: true,
                  actions: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(right: 24.w),
                        child: SvgPicture.asset(VImages.moreIcon),
                      ),
                    ),
                  ],
                  flexibleSpace: Container(
                    color: VColors.whiteColor,
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 28.h),
                child: getSpecificOrderCubit.getSpecificOrderModel.garage ==
                        null
                    ? LoadingWidget(iconColor: VColors.primaryColor500)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.r),
                              image: const DecorationImage(
                                image: AssetImage(VImages.bgOfTicketImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: VDeviceUtils.getScreenWidth(context) /
                                      1.6,
                                  child: Column(
                                    children: [
                                      /// Make Size
                                      SizedBox(height: 21.h),

                                      Text(
                                        '${AppLocalizations.of(context)!.translate('scanThisOnTheScannerMachine')} ',
                                        style: VStyles.bodyMediumMedium(context),
                                        textAlign: TextAlign.center,
                                      ),

                                      /// Make Size
                                      SizedBox(height: 5.h),

                                      /// BarCode
                                      Padding(
                                        padding: EdgeInsets.all(16.sp),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: getSpecificOrderCubit
                                              .getSpecificOrderModel
                                              .qrCode !=
                                              null
                                              ? Image.memory(
                                            base64Decode(
                                              getSpecificOrderCubit
                                                  .getSpecificOrderModel
                                                  .qrCode!
                                                  .split(',')[1],
                                            ),
                                            fit: BoxFit.cover,
                                            // width: double.infinity,
                                          )
                                              : Lottie.asset(
                                              VImages.qrCodeLoadingLottie),
                                        ),
                                      ),

                                      /// Make Size
                                      SizedBox(height: 36.h),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${AppLocalizations.of(context)!.translate('fullName')} ',
                                                  style: VStyles
                                                      .bodyMediumRegular(context)
                                                      .copyWith(
                                                    color: VColors.greyScale600,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                  getSpecificOrderCubit
                                                      .getSpecificOrderModel
                                                      .user!
                                                      .name ??
                                                      'No name',
                                                  style: VStyles.bodyLargeBold(context),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),

                                                /// Make Size
                                                SizedBox(height: 20.h),

                                                Text(
                                                  '${AppLocalizations.of(context)!.translate('parkingArea')} ',
                                                  style: VStyles
                                                      .bodyMediumRegular(context)
                                                      .copyWith(
                                                    color: VColors.greyScale600,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                  getSpecificOrderCubit
                                                      .getSpecificOrderModel
                                                      .garage!
                                                      .grageDescription
                                                      .toString(),
                                                  style: VStyles.bodyLargeBold(context),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),

                                                /// Make Size
                                                SizedBox(height: 20.h),

                                                Text(
                                                  '${AppLocalizations.of(context)!.translate('duration')} ',
                                                  style: VStyles
                                                      .bodyMediumRegular(context)
                                                      .copyWith(
                                                    color: VColors.greyScale600,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                  '${getSpecificOrderCubit.getSpecificOrderModel.duration} hours',
                                                  style: VStyles.bodyLargeBold(context),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),

                                                /// Make Size
                                                SizedBox(height: 20.h),
                                              ],
                                            ),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${AppLocalizations.of(context)!.translate('date')}',
                                                    style: VStyles
                                                        .bodyMediumRegular(context)
                                                        .copyWith(
                                                      color:
                                                          VColors.greyScale600,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${getSpecificOrderCubit.getSpecificOrderModel.timeRange!.start} - ${getSpecificOrderCubit.getSpecificOrderModel.timeRange!.end}',
                                                    style:
                                                    VStyles.bodyLargeBold(context),
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                  ),

                                                  /// Make Size
                                                  SizedBox(height: 20.h),
                                                  // Text(
                                                  //   'Parking Spot',
                                                  //   style: VStyles
                                                  //       .bodyMediumRegular(context)
                                                  //       .copyWith(
                                                  //     color:
                                                  //     VColors.greyScale600,
                                                  //     overflow:
                                                  //     TextOverflow.ellipsis,
                                                  //   ),
                                                  // ),
                                                  // Text(
                                                  //   '1st Floor (A05)',
                                                  //   style:
                                                  //   VStyles.bodyLargeBold(context),
                                                  //   overflow:
                                                  //   TextOverflow.ellipsis,
                                                  // ),

                                                  Text(
                                                    '${AppLocalizations.of(context)!.translate('date')}',
                                                    style: VStyles
                                                        .bodyMediumRegular(context)
                                                        .copyWith(
                                                      color:
                                                      VColors.greyScale600,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Text(
                                                    getSpecificOrderCubit
                                                        .getSpecificOrderModel
                                                        .toString(),
                                                    style:
                                                    VStyles.bodyLargeBold(context),
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                  ),

                                                  /// Make Size
                                                  SizedBox(height: 30.h),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Make Size
                          SizedBox(height: 26.h),

                          MainButtonWidget(
                            centerWidgetInButton: Text(
                              '${AppLocalizations.of(context)!.translate('navigateToParkingLot')}',
                              style: VStyles.bodyLargeBold(context).copyWith(
                                color: VColors.whiteColor,
                              ),
                            ),
                            margin: EdgeInsets.zero,
                            buttonColor: VColors.primaryColor500,
                            boxShadow: [AppBoxShadows.buttonShadowOne],
                            onTap: () async {
                              /// Create the Google Maps URL
                              String googleMapsUrl =
                                  "https://www.google.com/maps/search/?api=1&query=${getSpecificOrderCubit.getSpecificOrderModel.garage!.lat},${getSpecificOrderCubit.getSpecificOrderModel.garage!.lng}";

                              /// Go to google maps
                              if (await canLaunch(googleMapsUrl)) {
                                await launch(googleMapsUrl);

                                /// Launch Google Maps
                              } else {
                                throw 'Could not open Google Maps.';
                              }
                            },
                          ),

                          /// Make Size
                          SizedBox(height: 26.h),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
