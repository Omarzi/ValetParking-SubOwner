// import 'package:valetparking_subowner/features/get_all_orders_by_specific_garage/presentation/screens/get_all_orders_by_specific_garage_screen.dart';
// import 'package:valetparking_subowner/features/home/presentation/screens/home_screen.dart';
// import 'package:valetparking_subowner/features/profile/presentation/screens/profile_screen.dart';
import 'package:valetparking_subowner/features/home/managers/home_cubit.dart';
import 'package:valetparking_subowner/features/home/presentation/screens/home_screen.dart';
import 'package:valetparking_subowner/features/profile/presentation/screens/profile_screen.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key, required this.index});

  final int index;

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getAllOrdersInAllGarageFunction(status: 'ongoing');
    HomeCubit.get(context).getAttendanceInStartFunction(
        createdAtGTE: DateTime.now().toString(),
        createdAtLTE: DateTime.now().toString());
    HomeCubit.get(context).getAttendanceInEndFunction(
        createdAtGTE: DateTime.now().toString(),
        createdAtLTE: DateTime.now().toString());
    currentIndex = widget.index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List tabs = [
      const HomeScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: VColors.whiteColor,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              backgroundColor: VColors.whiteColor,
              title: Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: Text(
                  currentIndex == 0 ? AppLocalizations.of(context)!.translate('home')! : AppLocalizations.of(context)!.translate('profile')!,
                  style: VStyles.h4Bold(context),
                ),
              ),
              leading: Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: SvgPicture.asset(VImages.appBarIcon, width: 32.w),
              ),
              floating: true,
              pinned: true,
              flexibleSpace: Container(
                color: VColors.whiteColor,
              ),
            ),
          ];
        },
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: tabs[currentIndex],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 90.h,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.r),
            topLeft: Radius.circular(16.r),
          ),
          child: Theme(
            data: ThemeData(splashColor: Colors.transparent),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: VColors.greyScale50,
              iconSize: 24.sp,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              enableFeedback: false,
              selectedItemColor: VColors.primaryColor500,
              unselectedItemColor: VColors.greyScale500,
              selectedLabelStyle: VStyles.bodyXSmallBold(context)
                  .copyWith(color: VColors.primaryColor500),
              unselectedLabelStyle: VStyles.bodyXSmallMedium(context)
                  .copyWith(color: VColors.greyScale500),
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 57.6.w,
                    height: 38.h,
                    child: currentIndex == 0
                        ? SvgPicture.asset(VImages.homeIconSelected,
                            colorFilter: ColorFilter.mode(
                                VColors.primaryColor500, BlendMode.srcIn),
                            fit: BoxFit.scaleDown)
                        : SvgPicture.asset(VImages.homeIconNotSelected,
                            colorFilter: ColorFilter.mode(
                                VColors.greyScale500, BlendMode.srcIn),
                            fit: BoxFit.scaleDown),
                  ),
                  label: AppLocalizations.of(context)!.translate('home')!,
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 57.6.w,
                    height: 38.h,
                    child: currentIndex == 1
                        ? SvgPicture.asset(VImages.profileIconSelected,
                            colorFilter: ColorFilter.mode(
                                VColors.primaryColor500, BlendMode.srcIn),
                            fit: BoxFit.scaleDown)
                        : SvgPicture.asset(VImages.profileIconNotSelected,
                            colorFilter: ColorFilter.mode(
                                VColors.greyScale500, BlendMode.srcIn),
                            fit: BoxFit.scaleDown),
                  ),
                  label: AppLocalizations.of(context)!.translate('profile')!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
