import 'package:intl/intl.dart';
import 'package:valetparking_subowner/features/home/managers/home_cubit.dart';
import 'package:valetparking_subowner/features/home/presentation/screens/all_orders/all_orders_screen.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';

class AllDriversScreen extends StatefulWidget {
  const AllDriversScreen({super.key});

  @override
  State<AllDriversScreen> createState() => _AllDriversScreenState();
}

class _AllDriversScreenState extends State<AllDriversScreen> {
  bool isExpanded = false;
  int? expandedIndex;
  bool makeFilter = false;
  bool makeFilterByTime = false;

  TextEditingController filterToController = TextEditingController();
  TextEditingController filterToControllerByTime = TextEditingController();
  TextEditingController filterFromController = TextEditingController();
  TextEditingController filterFromControllerByTime = TextEditingController();
  final FocusNode filterToFocusNode = FocusNode();
  final FocusNode filterToByTimeFocusNode = FocusNode();
  final FocusNode filterFromFocusNode = FocusNode();
  final FocusNode filterFromByTimeFocusNode = FocusNode();
  bool isFilterToFieldFocused = false;
  bool isFilterToByTimeFieldFocused = false;
  bool isFilterFromFieldFocused = false;
  bool isFilterByTimeFromFieldFocused = false;

  int selectedIndex = 0;

  @override
  void initState() {
    HomeCubit.get(context).getAllDriversFunction();
    super.initState();
    /// Add listener to focus node
    filterFromFocusNode.addListener(
            () => setState(() => isFilterFromFieldFocused = filterFromFocusNode.hasFocus));
    filterFromByTimeFocusNode.addListener(
            () => setState(() => isFilterByTimeFromFieldFocused = filterFromByTimeFocusNode.hasFocus));
    filterToFocusNode.addListener(
            () => setState(() => isFilterToFieldFocused = filterToFocusNode.hasFocus));
    filterToByTimeFocusNode.addListener(
            () => setState(() => isFilterToByTimeFieldFocused = filterToByTimeFocusNode.hasFocus));
  }

  @override
  void dispose() {
    /// Clean up the focus node and controller when the widget is disposed.
    filterFromFocusNode.dispose();
    filterFromByTimeFocusNode.dispose();
    filterFromController.dispose();
    filterFromControllerByTime.dispose();
    filterToFocusNode.dispose();
    filterToByTimeFocusNode.dispose();
    filterToController.dispose();
    filterToControllerByTime.dispose();
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
            primaryColor: VColors.primaryColor500, /// Header background color
            colorScheme: ColorScheme.light(
              primary: VColors.primaryColor500, /// Header background color
              onPrimary: Colors.white, /// Header text color
              onSurface: VColors.greyScale900, /// Body text color
            ),
            dialogBackgroundColor: Colors.white, /// Background color of the dialog
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
        filterFromController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
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
            primaryColor: VColors.primaryColor500, /// Header background color
            colorScheme: ColorScheme.light(
              primary: VColors.primaryColor500, /// Header background color
              onPrimary: Colors.white, /// Header text color
              onSurface: VColors.greyScale900, /// Body text color
            ),
            dialogBackgroundColor: Colors.white, /// Background color of the dialog
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
          var getAllDriversCubit = HomeCubit.get(context);
          var driversList = getAllDriversCubit.getAllDriversModel.data;

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: VColors.whiteColor,
                  title: Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Text(
                      AppLocalizations.of(context)!.translate('allDrivers')!,
                      style: VStyles.h4Bold(context),
                    ),
                  ),
                  actions: [
                    // GestureDetector(
                    //   onTap: () {
                    //     final RenderBox overlay = Overlay.of(context)
                    //         .context
                    //         .findRenderObject() as RenderBox;
                    //     showMenu(
                    //       context: context,
                    //       color: VColors.whiteColor,
                    //       elevation: 5.sp,
                    //       shadowColor: VColors.gradientPrimary100,
                    //       position: RelativeRect.fromRect(
                    //         const Offset(double.infinity, 0) & const Size(80, 80),
                    //
                    //         /// Position the menu at the tapped location
                    //         Offset.zero & overlay.size,
                    //       ),
                    //       items: [
                    //         // PopupMenuItem<String>(
                    //         //   value: 'filterByStartAtte',
                    //         //   onTap: () {
                    //         //     setState(() {
                    //         //       makeFilter = true;
                    //         //     });
                    //         //   },
                    //         //   child: Text('Filter by start attendance',
                    //         //       style: VStyles.bodyLargeSemiBold),
                    //         // ),
                    //         // PopupMenuItem<String>(
                    //         //   value: 'filterByEndAtte',
                    //         //   onTap: () {
                    //         //     setState(() {
                    //         //       makeFilter = true;
                    //         //     });
                    //         //   },
                    //         //   child: Text('Filter by end attendance',
                    //         //       style: VStyles.bodyLargeSemiBold),
                    //         // ),
                    //       ],
                    //     ).then((value) {
                    //       /// Handle the selected value
                    //       if (value != null) {
                    //         switch (value) {
                    //           case 'filterByStartAtte':
                    //
                    //           /// Handle activation
                    //             logSuccess('true');
                    //             break;
                    //         }
                    //       }
                    //     });
                    //   },
                    //   child: Padding(
                    //     padding: EdgeInsets.only(right: 24.w),
                    //     child: SvgPicture.asset(VImages.moreIcon),
                    //   ),
                    // ),
                  ],
                  floating: true,
                  pinned: true,
                  flexibleSpace: Container(
                    color: VColors.whiteColor,
                  ),
                ),
              ];
            },
            body: driversList == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.translate('noDrivers')!,
                          style: VStyles.h6Bold(context),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : state is GetAllDriversLoadingModel ||
                        driversList == [] ||
                        driversList.isEmpty
                    ? Center(
                        child:
                            LoadingWidget(iconColor: VColors.primaryColor500),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 24.h,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              /// Make Space
                              SizedBox(height: 24.h),

                              if (makeFilter)
                                Column(
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
                                      hintText: AppLocalizations.of(context)!.translate('to')!,
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
                                            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.w),
                                            decoration: BoxDecoration(
                                              color: VColors.error,
                                              borderRadius: BorderRadius.circular(100.r),
                                            ),
                                            child: Center(
                                              child: Text(
                                                AppLocalizations.of(context)!.translate('close')!,
                                                style: VStyles.bodyLargeSemiBold(context).copyWith(
                                                  color: VColors.whiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        /// Make Space
                                        SizedBox(width: 24.h),
                                        GestureDetector(
                                          onTap: () {
                                            logSuccess(filterFromController.text);
                                            logSuccess(filterToController.text);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.w),
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

                              // if (makeFilterByTime)
                              //   Column(
                              //     children: [
                              //       TextFormFieldWidget(
                              //         controller: filterFromController,
                              //         textInputType: TextInputType.number,
                              //         focusNode: filterFromFocusNode,
                              //         hintText: 'From: 02-10-20',
                              //         hintColor: isFilterFromFieldFocused
                              //             ? VColors.primaryColor500
                              //             : VColors.greyScale500,
                              //         readOnly: true,
                              //         prefixIcon: Icon(
                              //           Iconsax.filter_search_copy,
                              //           color: isFilterFromFieldFocused
                              //               ? VColors.primaryColor500
                              //               : filterFromController.text.isNotEmpty
                              //               ? VColors.greyScale900
                              //               : VColors.greyScale500,
                              //         ),
                              //         suffixIcon: GestureDetector(
                              //           onTap: () {
                              //             selectDate1(context);
                              //           },
                              //           child: const ChoiceContainerInSuffixIcon(),
                              //         ),
                              //         fillColor: isFilterFromFieldFocused
                              //             ? VColors.purpleTransparent.withOpacity(.08)
                              //             : VColors.greyScale50,
                              //         borderSide: isFilterFromFieldFocused
                              //             ? BorderSide(color: VColors.primaryColor500)
                              //             : BorderSide.none,
                              //         obscureText: false,
                              //         inputFormatters: [DateInputFormatter2()],
                              //       ),
                              //       /// Make Space
                              //       SizedBox(height: 24.h),
                              //       TextFormFieldWidget(
                              //         controller: filterToController,
                              //         textInputType: TextInputType.number,
                              //         focusNode: filterToFocusNode,
                              //         readOnly: true,
                              //         hintText: 'To: 03-10-20',
                              //         hintColor: isFilterToFieldFocused
                              //             ? VColors.primaryColor500
                              //             : VColors.greyScale500,
                              //         prefixIcon: Icon(
                              //           Iconsax.filter_search_copy,
                              //           color: isFilterToFieldFocused
                              //               ? VColors.primaryColor500
                              //               : filterToController.text.isNotEmpty
                              //               ? VColors.greyScale900
                              //               : VColors.greyScale500,
                              //         ),
                              //         suffixIcon: GestureDetector(
                              //           onTap: () {
                              //             selectDate2(context);
                              //           },
                              //           child: const ChoiceContainerInSuffixIcon(),
                              //         ),
                              //         fillColor: isFilterToFieldFocused
                              //             ? VColors.purpleTransparent.withOpacity(.08)
                              //             : VColors.greyScale50,
                              //         borderSide: isFilterToFieldFocused
                              //             ? BorderSide(color: VColors.primaryColor500)
                              //             : BorderSide.none,
                              //         obscureText: false,
                              //         inputFormatters: [DateInputFormatter2()],
                              //       ),
                              //
                              //       /// Make Space
                              //       SizedBox(height: 16.h),
                              //
                              //       /// Two Buttons
                              //       Row(
                              //         mainAxisAlignment: MainAxisAlignment.center,
                              //         children: [
                              //           /// Close Button
                              //           GestureDetector(
                              //             onTap: () {
                              //               setState(() {
                              //                 makeFilter = false;
                              //               });
                              //             },
                              //             child: Container(
                              //               padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.w),
                              //               decoration: BoxDecoration(
                              //                 color: VColors.error,
                              //                 borderRadius: BorderRadius.circular(100.r),
                              //               ),
                              //               child: Center(
                              //                 child: Text(
                              //                   'Close',
                              //                   style: VStyles.bodyLargeSemiBold.copyWith(
                              //                     color: VColors.whiteColor,
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //           /// Make Space
                              //           SizedBox(width: 24.h),
                              //           GestureDetector(
                              //             onTap: () {
                              //               logSuccess(filterFromController.text);
                              //               logSuccess(filterToController.text);
                              //             },
                              //             child: Container(
                              //               padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 40.w),
                              //               decoration: BoxDecoration(
                              //                 color: VColors.primaryColor500,
                              //                 borderRadius: BorderRadius.circular(100.r),
                              //               ),
                              //               child: Center(
                              //                 child: Text(
                              //                   'Search',
                              //                   style: VStyles.bodyLargeSemiBold.copyWith(
                              //                     color: VColors.whiteColor,
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ],
                              //   ),

                              ///

                              // ListView.separated(
                              //   shrinkWrap: true,
                              //   padding: EdgeInsets.zero,
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   itemCount: driversList.length,
                              //   separatorBuilder: (context, index) {
                              //     return SizedBox(height: 18.h);
                              //   },
                              //   itemBuilder: (context, index) {
                              //     bool isExpanded = expandedIndex == index;
                              //     var garageList = driversList[index].garage;
                              //
                              //     return GestureDetector(
                              //       onTap: () {
                              //         setState(() {
                              //           if (expandedIndex == index) {
                              //             expandedIndex = null;
                              //           } else {
                              //             expandedIndex = index;
                              //           }
                              //         });
                              //       },
                              //       child: AnimatedContainer(
                              //         duration: const Duration(milliseconds: 300),
                              //         padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(16.r),
                              //           boxShadow: [AppBoxShadows.cardShadowFour],
                              //           gradient: AppGradients.whiteGradient,
                              //         ),
                              //         child: Column(
                              //           children: [
                              //             Row(
                              //               children: [
                              //                 /// Profile image
                              //                 CircleAvatar(
                              //                   radius: 20.r,
                              //                   backgroundImage: const AssetImage(VImages.profileImage),
                              //                 ),
                              //
                              //                 /// Space between profile image and text
                              //                 SizedBox(width: 12.w),
                              //
                              //                 /// User data
                              //                 Column(
                              //                   crossAxisAlignment: CrossAxisAlignment.start,
                              //                   children: [
                              //                     Text(
                              //                       driversList[index].email ?? 'email',
                              //                       style: VStyles.bodyMediumSemiBold.copyWith(
                              //                         color: VColors.primaryColor500,
                              //                       ),
                              //                     ),
                              //                     Text(
                              //                       driversList[index].salary?.toString() ?? 'salary',
                              //                       style: VStyles.bodySmallMedium,
                              //                     ),
                              //                   ],
                              //                 ),
                              //
                              //                 const Spacer(),
                              //
                              //                 /// Arrow icon with rotation animation
                              //                 TweenAnimationBuilder<double>(
                              //                   duration: const Duration(milliseconds: 300),
                              //                   tween: Tween<double>(begin: 0, end: isExpanded ? 0.5 : 0),
                              //                   builder: (context, angle, child) {
                              //                     return Transform.rotate(
                              //                       angle: angle * 3.14159, // Rotate 180 degrees when expanded
                              //                       child: Icon(
                              //                         Icons.keyboard_arrow_down_outlined,
                              //                         size: 22.sp,
                              //                       ),
                              //                     );
                              //                   },
                              //                 ),
                              //               ],
                              //             ),
                              //
                              //             /// Animate the size changes for expanding/collapsing content
                              //             AnimatedSize(
                              //               duration: const Duration(milliseconds: 300), // Duration for expansion/collapse
                              //               child: isExpanded
                              //                   ? Column(
                              //                 children: [
                              //                   SizedBox(height: 12.h),
                              //
                              //                   /// Additional Row 1
                              //                   Row(
                              //                     mainAxisAlignment: MainAxisAlignment.start,
                              //                     children: [
                              //                       Text(
                              //                         garageList![index].active == true ? 'Have places' : 'Not have places',
                              //                         style: VStyles.bodySmallMedium,
                              //                       ),
                              //                     ],
                              //                   ),
                              //
                              //                   Row(
                              //                     mainAxisAlignment: MainAxisAlignment.start,
                              //                     children: [
                              //                       Text(
                              //                         '${garageList[index].gragePricePerHoure} EGP per hour',
                              //                         style: VStyles.bodySmallMedium,
                              //                       ),
                              //                     ],
                              //                   ),
                              //
                              //                   Row(
                              //                     mainAxisAlignment: MainAxisAlignment.start,
                              //                     children: [
                              //                       Text(
                              //                         'Start: ${VDeviceUtils.formatTime(garageList[index].openDate!)}',
                              //                         style: VStyles.bodySmallMedium,
                              //                       ),
                              //                     ],
                              //                   ),
                              //
                              //                   Row(
                              //                     mainAxisAlignment: MainAxisAlignment.start,
                              //                     children: [
                              //                       Text(
                              //                         'End: ${VDeviceUtils.formatTime(garageList[index].endDate!)}',
                              //                         style: VStyles.bodySmallMedium,
                              //                       ),
                              //                     ],
                              //                   ),
                              //
                              //                   /// Additional Row 1
                              //                   Row(
                              //                     mainAxisAlignment: MainAxisAlignment.start,
                              //                     children: [
                              //                       Text(
                              //                         driversList[index].email!,
                              //                         style: VStyles.bodySmallMedium,
                              //                       ),
                              //                     ],
                              //                   ),
                              //
                              //                   /// Additional Row 2
                              //                   Row(
                              //                     mainAxisAlignment: MainAxisAlignment.start,
                              //                     children: [
                              //                       Text(
                              //                         driversList[index].role!,
                              //                         style: VStyles.bodySmallMedium,
                              //                       ),
                              //                     ],
                              //                   ),
                              //
                              //                   /// Additional Row 3
                              //                   Row(
                              //                     mainAxisAlignment: MainAxisAlignment.start,
                              //                     children: [
                              //                       Text(
                              //                         driversList[index].createdAt!,
                              //                         style: VStyles.bodySmallMedium,
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ],
                              //               )
                              //                   : SizedBox.shrink(), // When collapsed, no extra space
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // ),
                            ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: driversList.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 18.h);
                            },
                            itemBuilder: (context, index) {
                              bool isExpanded = expandedIndex == index;
                              var garageList = driversList[index].garage; // Fetch the garage list for the current driver

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (expandedIndex == index) {
                                      expandedIndex = null; // Collapse the item
                                    } else {
                                      expandedIndex = index; // Expand the item
                                    }
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    boxShadow: [AppBoxShadows.cardShadowFour],
                                    gradient: AppGradients.whiteGradient,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          /// Profile image
                                          CircleAvatar(
                                            radius: 20.r,
                                            backgroundImage: const AssetImage(VImages.profileImage),
                                          ),

                                          /// Space between profile image and text
                                          SizedBox(width: 12.w),

                                          /// User data
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                driversList[index].email ?? 'email',
                                                style: VStyles.bodyMediumSemiBold(context).copyWith(
                                                  color: VColors.primaryColor500,
                                                ),
                                              ),
                                              Text(
                                                driversList[index].salary?.toString() ?? 'salary',
                                                style: VStyles.bodySmallMedium(context),
                                              ),
                                            ],
                                          ),

                                          const Spacer(),

                                          /// Arrow icon with rotation animation
                                          TweenAnimationBuilder<double>(
                                            duration: const Duration(milliseconds: 300),
                                            tween: Tween<double>(begin: 0, end: isExpanded ? 0.5 : 0),
                                            builder: (context, angle, child) {
                                              return Transform.rotate(
                                                angle: angle * 3.14159, // Rotate 180 degrees when expanded
                                                child: Icon(
                                                  Icons.keyboard_arrow_down_outlined,
                                                  size: 22.sp,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),

                                      /// Animate the size changes for expanding/collapsing content
                                      AnimatedSize(
                                        duration: const Duration(milliseconds: 300), // Duration for expansion/collapse
                                        child: isExpanded && garageList != null && garageList.isNotEmpty
                                            ? Column(
                                          children: [
                                            SizedBox(height: 12.h),

                                            /// Loop over garageList to display its data safely
                                            for (var garage in garageList) ...[
                                              // Row(
                                              //   mainAxisAlignment: MainAxisAlignment.start,
                                              //   children: [
                                              //     Text(
                                              //       garage.active == true ? 'Have places' : 'Not have places',
                                              //       style: VStyles.bodySmallMedium,
                                              //     ),
                                              //   ],
                                              // ),

                                              // Row(
                                              //   mainAxisAlignment: MainAxisAlignment.start,
                                              //   children: [
                                              //     Text(
                                              //       '${garage.gragePricePerHoure} EGP per hour',
                                              //       style: VStyles.bodySmallMedium,
                                              //     ),
                                              //   ],
                                              // ),

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${AppLocalizations.of(context)!.translate('openDate')}: ${VDeviceUtils.formatTime(garage.openDate!)}',
                                                    style: VStyles.bodySmallMedium(context),
                                                  ),
                                                ],
                                              ),

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${AppLocalizations.of(context)!.translate('endDate')}: ${VDeviceUtils.formatTime(garage.endDate!)}',
                                                    style: VStyles.bodySmallMedium(context),
                                                  ),
                                                ],
                                              ),
                                            ],

                                            /// Additional driver data (email, role, etc.)
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  driversList[index].email!,
                                                  style: VStyles.bodySmallMedium(context),
                                                ),
                                              ],
                                            ),

                                            // Row(
                                            //   mainAxisAlignment: MainAxisAlignment.start,
                                            //   children: [
                                            //     Text(
                                            //       driversList[index].role!,
                                            //       style: VStyles.bodySmallMedium,
                                            //     ),
                                            //   ],
                                            // ),
                                            //
                                            // Row(
                                            //   mainAxisAlignment: MainAxisAlignment.start,
                                            //   children: [
                                            //     Text(
                                            //       driversList[index].createdAt!,
                                            //       style: VStyles.bodySmallMedium,
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        )
                                            : SizedBox.shrink(), // When collapsed or garageList is empty, no extra space
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
