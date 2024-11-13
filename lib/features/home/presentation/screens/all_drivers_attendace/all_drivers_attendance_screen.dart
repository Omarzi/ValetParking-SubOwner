import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:valetparking_subowner/features/home/managers/home_cubit.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';

class AllDriversAttendanceScreen extends StatefulWidget {
  const AllDriversAttendanceScreen({super.key});

  @override
  State<AllDriversAttendanceScreen> createState() =>
      _AllDriversAttendanceScreenState();
}

class _AllDriversAttendanceScreenState
    extends State<AllDriversAttendanceScreen> {
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
          var allDriversAttendanceCubit = HomeCubit.get(context);

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: VColors.whiteColor,
                  title: Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Text(
                      AppLocalizations.of(context)!.translate('allAttendances')!,
                      style: VStyles.h4Bold(context),
                    ),
                  ),
                  // actions: [
                  //   GestureDetector(
                  //     onTap: () {
                  //       final RenderBox overlay = Overlay.of(context)
                  //           .context
                  //           .findRenderObject() as RenderBox;
                  //       showMenu(
                  //         context: context,
                  //         color: VColors.whiteColor,
                  //         elevation: 5.sp,
                  //         shadowColor: VColors.gradientPrimary100,
                  //         position: RelativeRect.fromRect(
                  //           const Offset(double.infinity, 0) &
                  //               const Size(80, 80),
                  //
                  //           /// Position the menu at the tapped location
                  //           Offset.zero & overlay.size,
                  //         ),
                  //         items: [
                  //           PopupMenuItem<String>(
                  //             value: 'filterByDate',
                  //             onTap: () {
                  //               setState(() {
                  //                 makeFilter = true;
                  //               });
                  //             },
                  //             child: Text('Filter by Date',
                  //                 style: VStyles.bodyLargeSemiBold),
                  //           ),
                  //         ],
                  //       ).then((value) {
                  //         /// Handle the selected value
                  //         if (value != null) {
                  //           switch (value) {
                  //             case 'filterByDate':
                  //
                  //               /// Handle activation
                  //               logSuccess('true');
                  //               break;
                  //           }
                  //         }
                  //       });
                  //     },
                  //     child: Padding(
                  //       padding: EdgeInsets.only(right: 24.w),
                  //       child: SvgPicture.asset(VImages.moreIcon),
                  //     ),
                  //   ),
                  // ],
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

                  Lottie.asset(VImages.choicesLottie),

                  MainButtonWidget(
                    centerWidgetInButton: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconsax.profile_circle, color: VColors.whiteColor),
                        SizedBox(width: 8.w),
                        Text(
                          AppLocalizations.of(context)!.translate('allDriversAttendanceInOpen')!,
                          style: VStyles.bodyLargeBold(context).copyWith(
                            color: VColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    onTap: () => context.pushNamed(VRoutesName.attendanceInStart),
                    margin: EdgeInsets.zero,
                    buttonColor: VColors.primaryColor500,
                    boxShadow: const [],
                  ),


                  /// Make Space
                  SizedBox(height: 24.h),

                  MainButtonWidget(
                    centerWidgetInButton: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconsax.profile_circle, color: VColors.greyScale900),
                        SizedBox(width: 8.w),
                        Text(
                          AppLocalizations.of(context)!.translate('allDriversAttendanceInClose')!,
                          style: VStyles.bodyLargeBold(context).copyWith(
                            color: VColors.greyScale900,
                          ),
                        ),
                      ],
                    ),
                    onTap: () => context.pushNamed(VRoutesName.attendanceInEnd),
                    margin: EdgeInsets.zero,
                    buttonColor: VColors.primaryColor100,
                    boxShadow: const [],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
