import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valetparking_subowner/features/home/managers/home_cubit.dart';
import 'package:valetparking_subowner/features/home/presentation/screens/all_orders/all_orders_screen.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';

class AttendanceInEndScreen extends StatefulWidget {
  const AttendanceInEndScreen({super.key});

  @override
  State<AttendanceInEndScreen> createState() => _AttendanceInEndScreenState();
}

class _AttendanceInEndScreenState extends State<AttendanceInEndScreen> {
  TextEditingController filterToController = TextEditingController();
  TextEditingController filterFromController = TextEditingController();
  final FocusNode filterToFocusNode = FocusNode();
  final FocusNode filterFromFocusNode = FocusNode();
  bool isFilterToFieldFocused = false;
  bool isFilterFromFieldFocused = false;
  int selectedIndex = 0;
  bool makeFilter = false;

  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getAttendanceInEndFunction(createdAtGTE: DateTime.now().toString(), createdAtLTE: DateTime.now().toString());
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
            DateFormat('yyyy-MM-dd').format(selectedDate);
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
        filterToController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
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
          var getAttendanceInStartCubit = HomeCubit.get(context);
          var driverItem = getAttendanceInStartCubit.getAttendanceInStartResponseModel.data;

          return NestedScrollView(
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: VColors.whiteColor,
                  title: Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Text(
                      AppLocalizations.of(context)!.translate('makeReportInOpen')!,
                      style: VStyles.h4Bold(context),
                    ),
                  ),
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

                  driverItem == null
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.translate('haveAnProblemInGetSavedItems')!,
                          style: VStyles.h6Bold(context),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )


                      : Column(
                    children: [
                      TextFormFieldWidget(
                        controller: filterFromController,
                        textInputType: TextInputType.number,
                        focusNode: filterFromFocusNode,
                        hintText: AppLocalizations.of(context)!.translate('from')!,
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
                            ? VColors.purpleTransparent
                            .withOpacity(.08)
                            : VColors.greyScale50,
                        borderSide: isFilterFromFieldFocused
                            ? BorderSide(
                            color: VColors.primaryColor500)
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
                            ? VColors.purpleTransparent
                            .withOpacity(.08)
                            : VColors.greyScale50,
                        borderSide: isFilterToFieldFocused
                            ? BorderSide(
                            color: VColors.primaryColor500)
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
                              filterToController.clear();
                              filterFromController.clear();
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 40.w),
                              decoration: BoxDecoration(
                                color: VColors.error,
                                borderRadius:
                                BorderRadius.circular(100.r),
                              ),
                              child: Center(
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('close')!}',
                                  style: VStyles.bodyLargeSemiBold
                                      (context).copyWith(
                                    color: VColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /// Make Space
                          SizedBox(width: 24.h),
                          GestureDetector(
                            onTap: filterToController.text == '' &&
                                filterFromController.text == ''
                                ? null
                                : () {
                              getAttendanceInStartCubit
                                  .getAttendanceInEndFunction(
                                createdAtGTE:
                                filterFromController.text,
                                createdAtLTE:
                                filterToController.text,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 40.w),
                              decoration: BoxDecoration(
                                color: VColors.primaryColor500,
                                borderRadius:
                                BorderRadius.circular(100.r),
                              ),
                              child: Center(
                                child: Text(
                                  '${AppLocalizations.of(context)!.translate('seach')!}',
                                  style: VStyles.bodyLargeSemiBold
                                      (context).copyWith(
                                    color: VColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      /// Make Space
                      SizedBox(height: 16.h),

                      Divider(color: VColors.greyScale200),

                      /// Make Space
                      SizedBox(height: 16.h),

                      driverItem == [] ||
                          driverItem.isEmpty
                          ? Text('${AppLocalizations.of(context)!.translate('theAttendanceIsEmpty')}', style: VStyles.h4Bold(context))
                          :
                      state is GetAttendanceInStartLoadingState
                          ? LoadingWidget(
                          iconColor: VColors.primaryColor500)
                          : Container(
                        // color: Colors.red,
                        height: VDeviceUtils.getScreenHeight(
                            context) /
                            1.7,
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        width: double.infinity,
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: driverItem.length,
                          separatorBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(height: 16.h),
                                Divider(color: VColors.greyScale200),
                                SizedBox(height: 16.h),
                              ],
                            );
                          },
                          itemBuilder: (context, index) {
                            // return Column(
                            //   children: [
                            //     Text(driverItem[index].garage?.garageName ?? 'No garage name'),
                            //     Text(driverItem[index].garage?.garageDescription ?? 'No garage description'),
                            //     Text('${driverItem[index].garage?.lat} - ${driverItem[index].garage?.lng}'),
                            //     Text('${driverItem[index].garage?.garagePricePerHour} EGP' ?? 'No garage price'),
                            //     Text(driverItem[index].garage?.active == true ? 'Have space' : 'Not have space'),
                            //     Text(driverItem[index].garage?.openDate ?? 'No attendance in open'),
                            //     Text(driverItem[index].garage?.endDate ?? 'No attendance in close'),
                            //     Text(driverItem[index].status!),
                            //     Text(driverItem[index].driver?.email ?? 'No Email'),
                            //     Text(driverItem[index].driver?.startIn ?? 'No Start'),
                            //   ],
                            // );
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20.h),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.h,
                                  horizontal: 12.w),
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                color: VColors.greyScale50,
                                border: Border.all(
                                  color: VColors.greyScale300,
                                  width: 1.w,
                                ),
                                borderRadius: BorderRadius.circular(18.r),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${AppLocalizations.of(context)!.translate('garageName')}: ${driverItem[index].garage?.garageName ?? 'No garage name'}',
                                    style: VStyles.h6Bold(context).copyWith(color: VColors.primaryColor500),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '${AppLocalizations.of(context)!.translate('garageDescription')}: ${driverItem[index].garage?.garageDescription ?? 'No garage description'}',
                                    style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                  ),
                                  SizedBox(height: 6.h),
                                  GestureDetector(
                                    onTap: () {
                                      final lat = driverItem[index].garage?.lat;
                                      final lng = driverItem[index].garage?.lng;

                                      if (lat != null && lng != null) {
                                        final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
                                        _launchURL(url);
                                      } else {
                                        // Handle case where location is not available
                                        print('Location not available');
                                      }
                                    },
                                    child: Text(
                                      '${AppLocalizations.of(context)!.translate('location')}: ${driverItem[index].garage?.lat ?? 'No location latitude'} - ${driverItem[index].garage?.lng ?? 'No location long'}',
                                      style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    '${AppLocalizations.of(context)!.translate('garagePricePerHour')}: ${driverItem[index].garage?.garagePricePerHour ?? 'No garage price'} EGP',
                                    style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    '${AppLocalizations.of(context)!.translate('active')}: ${driverItem[index].garage?.active == true ? 'Have space' : 'Not have space'}',
                                    style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    '${AppLocalizations.of(context)!.translate('openTime')}: ${driverItem[index].garage?.openDate ?? 'No attendance in open'}',
                                    style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    '${AppLocalizations.of(context)!.translate('endTime')}: ${driverItem[index].garage?.endDate ?? 'No attendance in end'}',
                                    style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    '${AppLocalizations.of(context)!.translate('status')}: ${driverItem[index].status ?? 'No status in garage'}',
                                    style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    '${AppLocalizations.of(context)!.translate('driverEmail')}: ${driverItem[index].driver?.email ?? 'No email in driver'}',
                                    style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    '${AppLocalizations.of(context)!.translate('endIn')}: ${driverItem[index].driver?.startIn ?? 'No start in driver'} - ${AppLocalizations.of(context)!.translate('endIn')}: ${driverItem[index].driver?.startIn ?? 'No end in driver'}',
                                    style: VStyles.bodyLargeSemiBold(context).copyWith(color: VColors.greyScale700),
                                  ),
                                ],
                              ),
                            );

                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
