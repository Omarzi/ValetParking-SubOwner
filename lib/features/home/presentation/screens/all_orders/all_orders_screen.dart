import 'package:valetparking_subowner/features/home/managers/home_cubit.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';
import 'package:intl/intl.dart';

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({super.key});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  TextEditingController filterToController = TextEditingController();
  TextEditingController filterFromController = TextEditingController();
  final FocusNode filterToFocusNode = FocusNode();
  final FocusNode filterFromFocusNode = FocusNode();
  bool isFilterToFieldFocused = false;
  bool isFilterFromFieldFocused = false;

  int selectedIndex = 0;

  final List<String> items = ['Ongoing', 'Completed', 'Cancelled'];

  bool makeFilter = false;

  @override
  void initState() {
    super.initState();

    /// Add listener to focus node
    filterFromFocusNode.addListener(() => setState(
        () => isFilterFromFieldFocused = filterFromFocusNode.hasFocus));
    filterToFocusNode.addListener(() =>
        setState(() => isFilterToFieldFocused = filterToFocusNode.hasFocus));
  }

  @override
  void dispose() {
    /// Clean up the focus node and controller when the widget is disposed.
    filterFromFocusNode.dispose();
    filterFromController.dispose();
    filterToFocusNode.dispose();
    filterToController.dispose();
    super.dispose();
  }

  Future<void> selectDate1(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: VColors.primaryColor500,

            /// Header background color
            colorScheme: ColorScheme.light(
              primary: VColors.primaryColor500,

              /// Header background color
              onPrimary: Colors.white,

              /// Header text color
              onSurface: VColors.greyScale900,

              /// Body text color
            ),
            dialogBackgroundColor: Colors.white,

            /// Background color of the dialog
            buttonTheme: ButtonThemeData(
              buttonColor: VColors.primaryColor500,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        filterFromController.text =
            DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  Future<void> selectDate2(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: VColors.primaryColor500,

            /// Header background color
            colorScheme: ColorScheme.light(
              primary: VColors.primaryColor500,

              /// Header background color
              onPrimary: Colors.white,

              /// Header text color
              onSurface: VColors.greyScale900,

              /// Body text color
            ),
            dialogBackgroundColor: Colors.white,

            /// Background color of the dialog
            buttonTheme: ButtonThemeData(
              buttonColor: VColors.primaryColor500,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        filterToController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var orderCubit = HomeCubit.get(context);
          var orderItem = orderCubit.getOrdersInAllGaragesModel.orderDetails;

          return RefreshIndicator(
            onRefresh: () {
              return orderCubit.getAllOrdersInAllGarageFunction(
                  status: 'ongoing');
            },
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    elevation: 0,
                    backgroundColor: VColors.whiteColor,
                    title: Padding(
                      padding: EdgeInsets.only(right: 24.w),
                      child: Text(
                        '${AppLocalizations.of(context)!.translate('allOrders')}',
                        style: VStyles.h4Bold(context),
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          final RenderBox overlay = Overlay.of(context)
                              .context
                              .findRenderObject() as RenderBox;
                          showMenu(
                            context: context,
                            color: VColors.whiteColor,
                            elevation: 5.sp,
                            shadowColor: VColors.gradientPrimary100,
                            position: RelativeRect.fromRect(
                              const Offset(double.infinity, 0) &
                                  const Size(80, 80),

                              /// Position the menu at the tapped location
                              Offset.zero & overlay.size,
                            ),
                            items: [
                              PopupMenuItem<String>(
                                value: 'filterByDate',
                                onTap: () {
                                  setState(() {
                                    makeFilter = true;
                                  });
                                },
                                child: Text('${AppLocalizations.of(context)!.translate('filterByDate')}',
                                    style: VStyles.bodyLargeSemiBold(context)),
                              ),
                            ],
                          ).then((value) {
                            /// Handle the selected value
                            if (value != null) {
                              switch (value) {
                                case 'filterByDate':

                                  /// Handle activation
                                  logSuccess('true');
                                  break;
                              }
                            }
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 24.w),
                          child: SvgPicture.asset(VImages.moreIcon),
                        ),
                      ),
                    ],
                    floating: true,
                    pinned: true,
                    flexibleSpace: Container(
                      color: VColors.whiteColor,
                    ),
                  ),
                ];
              },
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    /// Make Space
                    SizedBox(height: 24.h),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: List.generate(
                    //     items.length,
                    //         (index) {
                    //       return GestureDetector(
                    //         onTap: () {
                    //           setState(() {
                    //             selectedIndex = index;
                    //           });
                    //         },
                    //         child: AnimatedContainer(
                    //           duration: const Duration(milliseconds: 300),
                    //           curve: Curves.easeInOut,
                    //           // Feel free to change the curve for different animations
                    //           padding: EdgeInsets.symmetric(
                    //             vertical: 10.h,
                    //             horizontal: index == 1
                    //                 ? 14.w
                    //                 : index == 2
                    //                 ? 21.w
                    //                 : 24.w,
                    //           ),
                    //           decoration: BoxDecoration(
                    //             color: selectedIndex == index
                    //                 ? VColors.primaryColor500
                    //                 : Colors.white,
                    //             borderRadius: BorderRadius.circular(100.r),
                    //             border: Border.all(
                    //               color: VColors.primaryColor500,
                    //               width: 2.w,
                    //             ),
                    //           ),
                    //           child: Text(
                    //             items[index],
                    //             style: VStyles.bodyXLargeBold.copyWith(
                    //               color: selectedIndex == index
                    //                   ? Colors.white
                    //                   : VColors.primaryColor500,
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        items.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                              selectedIndex == 0
                                  ? orderCubit.getAllOrdersInAllGarageFunction(
                                      status: 'ongoing')
                                  : selectedIndex == 1
                                      ? orderCubit
                                          .getAllOrdersInAllGarageFunction(
                                              status: 'completed')
                                      : orderCubit
                                          .getAllOrdersInAllGarageFunction(
                                              status: 'canceled');
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              // Feel free to change the curve for different animations
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: index == 1
                                    ? 14.w
                                    : index == 2
                                        ? 21.w
                                        : 24.w,
                              ),
                              decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? VColors.primaryColor500
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(
                                  color: VColors.primaryColor500,
                                  width: 2.w,
                                ),
                              ),
                              child: Text(
                                items[index],
                                style: VStyles.bodyXLargeBold(context).copyWith(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : VColors.primaryColor500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    /// Make Space
                    SizedBox(height: 24.h),

                    if (makeFilter)
                      Column(
                        children: [
                          TextFormFieldWidget(
                            controller: filterFromController,
                            textInputType: TextInputType.number,
                            focusNode: filterFromFocusNode,
                            hintText: '${AppLocalizations.of(context)!.translate('from')!}',
                            hintColor: isFilterFromFieldFocused
                                ? VColors.primaryColor500
                                : VColors.greyScale500,
                            readOnly: true,
                            prefixIcon: Icon(
                              Iconsax.filter_search_copy,
                              color: isFilterFromFieldFocused
                                  ? VColors.primaryColor500
                                  : filterFromController.text.isNotEmpty
                                      ? VColors.greyScale900
                                      : VColors.greyScale500,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                selectDate1(context);
                              },
                              child: const ChoiceContainerInSuffixIcon(),
                            ),
                            fillColor: isFilterFromFieldFocused
                                ? VColors.purpleTransparent.withOpacity(.08)
                                : VColors.greyScale50,
                            borderSide: isFilterFromFieldFocused
                                ? BorderSide(color: VColors.primaryColor500)
                                : BorderSide.none,
                            obscureText: false,
                            inputFormatters: [DateInputFormatter2()],
                          ),

                          /// Make Space
                          SizedBox(height: 24.h),
                          TextFormFieldWidget(
                            controller: filterToController,
                            textInputType: TextInputType.number,
                            focusNode: filterToFocusNode,
                            readOnly: true,
                            hintText: '${AppLocalizations.of(context)!.translate('to')!}',
                            hintColor: isFilterToFieldFocused
                                ? VColors.primaryColor500
                                : VColors.greyScale500,
                            prefixIcon: Icon(
                              Iconsax.filter_search_copy,
                              color: isFilterToFieldFocused
                                  ? VColors.primaryColor500
                                  : filterToController.text.isNotEmpty
                                      ? VColors.greyScale900
                                      : VColors.greyScale500,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                selectDate2(context);
                              },
                              child: const ChoiceContainerInSuffixIcon(),
                            ),
                            fillColor: isFilterToFieldFocused
                                ? VColors.purpleTransparent.withOpacity(.08)
                                : VColors.greyScale50,
                            borderSide: isFilterToFieldFocused
                                ? BorderSide(color: VColors.primaryColor500)
                                : BorderSide.none,
                            obscureText: false,
                            inputFormatters: [DateInputFormatter2()],
                          ),

                          /// Make Space
                          SizedBox(height: 16.h),

                          /// Two Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /// Close Button
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    makeFilter = false;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 40.w),
                                  decoration: BoxDecoration(
                                    color: VColors.error,
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${AppLocalizations.of(context)!.translate('close')!}',
                                      style: VStyles.bodyLargeSemiBold(context).copyWith(
                                        color: VColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              /// Make Space
                              SizedBox(width: 24.h),
                              // GestureDetector(
                              //   onTap: () {
                              //     logSuccess(filterFromController.text);
                              //     logSuccess(filterToController.text);
                              //     // orderCubit.getAllOrdersInAllGarageFunction(
                              //     //   status: selectedIndex == 2
                              //     //       ? 'cancelled'
                              //     //       : selectedIndex == 1
                              //     //           ? 'completed'
                              //     //           : 'ongoing',
                              //     //   dateGte: DateTime(filterFromController.text),
                              //     //   dateLte: DateTime(filterFromController.text),
                              //     // );
                              //   },
                              //   child: Container(
                              //     padding: EdgeInsets.symmetric(
                              //         vertical: 8.h, horizontal: 40.w),
                              //     decoration: BoxDecoration(
                              //       color: VColors.primaryColor500,
                              //       borderRadius: BorderRadius.circular(100.r),
                              //     ),
                              //     child: Center(
                              //       child: Text(
                              //         'Search',
                              //         style: VStyles.bodyLargeSemiBold.copyWith(
                              //           color: VColors.whiteColor,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              GestureDetector(
                                onTap: () {
                                  try {
                                    // Define date format
                                    DateFormat inputFormat =
                                        DateFormat('dd-MM-yyyy');
                                    DateFormat outputFormat =
                                        DateFormat('yyyy-MM-dd');

                                    // Parse the input date strings
                                    DateTime fromDate = inputFormat
                                        .parse(filterFromController.text);
                                    DateTime toDate = inputFormat
                                        .parse(filterToController.text);

                                    // Format the parsed dates into 'YYYY-MM-DD'
                                    String formattedFromDate =
                                        outputFormat.format(fromDate);
                                    String formattedToDate =
                                        outputFormat.format(toDate);

                                    // Pass the formatted dates to the function
                                    orderCubit.getAllOrdersInAllGarageFunction(
                                      status: selectedIndex == 2
                                          ? 'cancelled'
                                          : selectedIndex == 1
                                              ? 'completed'
                                              : 'ongoing',
                                      dateGte:
                                          DateTime.parse(formattedFromDate),
                                      // Convert string back to DateTime
                                      dateLte: DateTime.parse(
                                        formattedToDate,
                                      ), // Convert string back to DateTime
                                    );
                                  } catch (e) {
                                    // Handle potential date parsing errors
                                    print('Date parsing error: $e');
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 40.w),
                                  decoration: BoxDecoration(
                                    color: VColors.primaryColor500,
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${AppLocalizations.of(context)!.translate('search')!}',
                                      style: VStyles.bodyLargeSemiBold(context).copyWith(
                                        color: VColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    /// Make Space
                    if (makeFilter) SizedBox(height: 24.h),

                    selectedIndex == 2

                        /// Cancelled
                        ? Expanded(
                            child:
                                state is GetAllOrdersInAllGaragesLoadingState ||
                                        orderItem == []
                                    ? Center(
                                        child: LoadingWidget(
                                            iconColor: VColors.primaryColor500),
                                      )
                                    : orderItem == null
                                        ? Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${AppLocalizations.of(context)!.translate('haveAnProblemInGetOrdersItems')!}',
                                                  style: VStyles.h6Bold(context),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          )
                                        : orderItem!.isEmpty
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Lottie.asset(
                                                    VImages.orderEmptyLottie,
                                                  ),
                                                  SizedBox(height: 40.h),
                                                  Text('${AppLocalizations.of(context)!.translate('emptyCancelOrder')!}',
                                                      style: VStyles
                                                          .bodyXLargeBold(context)),
                                                ],
                                              )
                                            : ListView.separated(
                                                shrinkWrap: true,
                                                padding: EdgeInsets.zero,
                                                itemBuilder: (context, index) {
                                                  return CancelledWidget(
                                                    pLaceImage: VImages
                                                        .welBeckNorthImagePlace,
                                                    placeName: orderItem[index]
                                                                .garage ==
                                                            null
                                                        ? '...'
                                                        : orderItem[index]
                                                            .garage!
                                                            .garageName
                                                            .toString(),
                                                    placeDesc: orderItem[index]
                                                                .garage ==
                                                            null
                                                        ? '..'
                                                        : orderItem[index]
                                                            .garage!
                                                            .garageDescription
                                                            .toString(),
                                                    placePrice:
                                                        '\$ ${orderItem[index].garage == null ? '..' : orderItem[index].garage!.garagePricePerHour}',
                                                    numberOfWaiting:
                                                        orderItem[index]
                                                            .duration
                                                            .toString(),
                                                    onTap: () {
                                                      VDeviceUtils
                                                          .showCustomBottomSheet(
                                                              context: context,
                                                              widget:
                                                                  const CancelParkingWidget());
                                                    },
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(height: 20.h);
                                                },
                                                itemCount: orderItem.length,
                                              ),
                          )

                        /// Completed
                        : selectedIndex == 1
                            ? Expanded(
                                child:
                                    state is GetAllOrdersInAllGaragesLoadingState ||
                                            orderItem == []
                                        ? Center(
                                            child: LoadingWidget(
                                                iconColor:
                                                    VColors.primaryColor500),
                                          )
                                        : orderItem == null
                                            ? Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${AppLocalizations.of(context)!.translate('haveAnAProblemInGetOrdersItems')!}',
                                                      style: VStyles.h6Bold(context),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : orderItem!.isEmpty
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Lottie.asset(
                                                        VImages
                                                            .orderEmptyLottie,
                                                      ),
                                                      SizedBox(height: 40.h),
                                                      Text(
                                                          '${AppLocalizations.of(context)!.translate('emptyCompletedOrder')!}',
                                                          style: VStyles
                                                              .bodyXLargeBold(context)),
                                                    ],
                                                  )
                                                : ListView.separated(
                                                    shrinkWrap: true,
                                                    padding: EdgeInsets.zero,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return CompleteWidget(
                                                        pLaceImage: VImages
                                                            .welBeckNorthImagePlace,
                                                        placeName: orderItem[
                                                                        index]
                                                                    .garage ==
                                                                null
                                                            ? '..'
                                                            : orderItem[index]
                                                                .garage!
                                                                .garageName
                                                                .toString(),
                                                        placeDesc: orderItem[
                                                                        index]
                                                                    .garage ==
                                                                null
                                                            ? '..'
                                                            : orderItem[index]
                                                                .garage!
                                                                .garageDescription
                                                                .toString(),
                                                        placePrice:
                                                            '\$ ${orderItem[index].garage == null ? '..' : orderItem[index].garage!.garagePricePerHour}',
                                                        numberOfWaiting:
                                                            orderItem[index]
                                                                .duration
                                                                .toString(),
                                                        onTap: () {
                                                          context.pushNamed(
                                                              VRoutesName
                                                                  .parkingTicketRoute);
                                                        },
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return SizedBox(
                                                          height: 20.h);
                                                    },
                                                    itemCount: orderItem.length,
                                                  ),
                              )

                            /// Ongoing
                            : Expanded(
                                child:
                                    state is GetAllOrdersInAllGaragesLoadingState ||
                                            orderItem == []
                                        ? Center(
                                            child: LoadingWidget(
                                                iconColor:
                                                    VColors.primaryColor500),
                                          )
                                        : orderItem == null
                                            ? Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${AppLocalizations.of(context)!.translate('haveAnAProblemInGetOrdersItems')!}',
                                                      style: VStyles.h6Bold(context),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : orderItem!.isEmpty
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Lottie.asset(VImages
                                                          .orderEmptyLottie),
                                                      SizedBox(height: 40.h),
                                                      Text(
                                                          '${AppLocalizations.of(context)!.translate('emptyOngoingOrder')!}',
                                                          style: VStyles
                                                              .bodyXLargeBold(context)),
                                                    ],
                                                  )
                                                : ListView.separated(
                                                    shrinkWrap: true,
                                                    padding: EdgeInsets.zero,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return OnGoingWidget(
                                                        pLaceImage: VImages
                                                            .welBeckNorthImagePlace,
                                                        placeName: orderItem[
                                                                        index]
                                                                    .garage ==
                                                                null
                                                            ? '..'
                                                            : orderItem[index]
                                                                .garage!
                                                                .garageName
                                                                .toString(),
                                                        placeDesc: orderItem[
                                                                        index]
                                                                    .garage ==
                                                                null
                                                            ? '..'
                                                            : orderItem[index]
                                                                .garage!
                                                                .garageDescription
                                                                .toString(),
                                                        placePrice:
                                                            '\$ ${orderItem[index].garage == null ? '..' : orderItem[index].garage!.garagePricePerHour}',
                                                        numberOfWaiting:
                                                            orderItem[index]
                                                                .duration
                                                                .toString(),
                                                        status: orderItem[index]
                                                                    .isPaid ==
                                                                null
                                                            ? ''
                                                            : orderItem[index]
                                                                    .isPaid!
                                                                ? 'Paid'
                                                                : 'Not Paid',
                                                        onViewTimer: () {
                                                          // context.pushNamed(
                                                          //     VRoutesName.parkingTimerRoute);
                                                          context.pushNamed(
                                                            VRoutesName
                                                                .parkingTimerRoute,
                                                            arguments: {
                                                              'parkingArea':
                                                                  orderItem[
                                                                          index]
                                                                      .garage!
                                                                      .garageName,
                                                              'lat': orderItem[
                                                                      index]
                                                                  .garage!
                                                                  .lat,
                                                              'lng': orderItem[
                                                                      index]
                                                                  .garage!
                                                                  .lng,
                                                              'typeCar':
                                                                  orderItem[
                                                                          index]
                                                                      .typeOfCar,
                                                              'date': orderItem[
                                                                      index]
                                                                  .date,
                                                              'duration':
                                                                  orderItem[
                                                                          index]
                                                                      .duration,
                                                              'start': orderItem[
                                                                      index]
                                                                  .timeRange!
                                                                  .start,
                                                              'end': orderItem[
                                                                      index]
                                                                  .timeRange!
                                                                  .end,
                                                            },
                                                          );
                                                        },
                                                        onShowTicket: () {
                                                          context.pushNamed(
                                                            VRoutesName
                                                                .parkingTicketRoute,
                                                            arguments:
                                                                orderItem[index]
                                                                    .orderId,
                                                          );
                                                        },
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (context, index) {
                                                      return SizedBox(
                                                          height: 20.h);
                                                    },
                                                    itemCount: orderItem.length,
                                                  ),
                              ),
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

class ChoiceContainerInSuffixIcon extends StatelessWidget {
  const ChoiceContainerInSuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: VDeviceUtils.getScreenWidth(context) / 5,
      decoration: BoxDecoration(
        // color: Colors.red,
        color: VColors.primaryColor500,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
      ),
      child: Center(
        child: Text(
          '${AppLocalizations.of(context)!.translate('emptyOngoingOrder')!}',
          style: VStyles.bodyMediumRegular(context).copyWith(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
