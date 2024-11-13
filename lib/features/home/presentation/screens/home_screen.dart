import 'package:valetparking_subowner/utils/constants/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          right: 32.w,
          left: 32.w,
          bottom: 48.h,
        ),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.translate('chooseFromTheFollowing')!,
              style: VStyles.h4Bold(context),
              textAlign: TextAlign.center,
            ),

            /// Make Space
            SizedBox(height: 24.h),

            Text(
              AppLocalizations.of(context)!.translate('choice')!,
              style: VStyles.h2Bold(context).copyWith(
                color: VColors.primaryColor500,
              ),
              textAlign: TextAlign.center,
            ),

            /// Make Space
            SizedBox(height: 36.h),

            /// All orders Button
            MainButtonWidget(
              centerWidgetInButton: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Icon(Iconsax.scan, color: Colors.white),
                  SvgPicture.asset(VImages.bookingIconNotSelected, color: VColors.whiteColor),
                  SizedBox(width: 8.w),
                  Text(
                    AppLocalizations.of(context)!.translate('allOrders')!,
                    style: VStyles.bodyLargeBold(context).copyWith(
                      color: VColors.whiteColor,
                    ),
                  ),
                ],
              ),
              onTap: () => context.pushNamed(VRoutesName.allOrdersRoute),
              margin: EdgeInsets.zero,
              buttonColor: VColors.primaryColor500,
              boxShadow: [AppBoxShadows.buttonShadowOne],
            ),

            // /// Make Space
            // SizedBox(height: 24.h),
            //
            // /// All users Button
            // MainButtonWidget(
            //   centerWidgetInButton: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Icon(Iconsax.profile_circle, color: VColors.greyScale900),
            //       SizedBox(width: 8.w),
            //       Text(
            //         'All users',
            //         style: VStyles.bodyLargeBold.copyWith(
            //           color: VColors.greyScale900,
            //         ),
            //       )
            //     ],
            //   ),
            //   onTap: () => context.pushNamed(VRoutesName.allUsersRoute),
            //   margin: EdgeInsets.zero,
            //   buttonColor: VColors.primaryColor100,
            //   boxShadow: [],
            // ),

            /// Make Space
            SizedBox(height: 24.h),

            /// All drivers attendance Button
            MainButtonWidget(
              centerWidgetInButton: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.profile_circle, color: VColors.greyScale900),
                  SizedBox(width: 8.w),
                  Text(
                    AppLocalizations.of(context)!.translate('allDriversAttendance')!,
                    style: VStyles.bodyLargeBold(context).copyWith(
                      color: VColors.greyScale900,
                    ),
                  ),
                ],
              ),
              onTap: () => context.pushNamed(VRoutesName.allDriversAttendanceRoute),
              margin: EdgeInsets.zero,
              buttonColor: VColors.primaryColor100,
              boxShadow: [],
            ),

            /// Make Space
            SizedBox(height: 24.h),

            /// All drivers Button
            MainButtonWidget(
              centerWidgetInButton: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.profile_circle, color: VColors.greyScale900),
                  SizedBox(width: 8.w),
                  Text(
                    AppLocalizations.of(context)!.translate('allDrivers')!,
                    style: VStyles.bodyLargeBold(context).copyWith(
                      color: VColors.greyScale900,
                    ),
                  ),
                ],
              ),
              onTap: () => context.pushNamed(VRoutesName.allDriversRoute),
              margin: EdgeInsets.zero,
              buttonColor: VColors.primaryColor100,
              boxShadow: [],
            ),

          ],
        ),
      ),
    );
  }
}
