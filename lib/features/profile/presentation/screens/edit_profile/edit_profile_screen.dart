import 'package:valetparking_subowner/features/profile/presentation/widgets/edit_profile/edit_profile_form_widget.dart';
import 'package:valetparking_subowner/navigation_menu.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        context.pushReplacementNamed(VRoutesName.navigationMenuRoute, arguments: 1);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0,
                backgroundColor: VColors.whiteColor,
                title: Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: Text(
                    AppLocalizations.of(context)!.translate('editProfile')!,
                    style: VStyles.h4Bold(context),
                  ),
                ),
                leading: IconButton(
                  onPressed: () =>  Navigator.of(context).pushReplacement(createPageRoute()),
                  icon: const Icon(Icons.arrow_back_outlined),
                ),
                floating: true,
                pinned: true,
                flexibleSpace: Container(
                  color: VColors.whiteColor,
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h, bottom: 48.h),
              child: const Column(
                children: [
                  EditProfileFormWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Route createPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
      const NavigationMenu(index: 1),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset(0.0, 0.0);
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500), /// 500 milliseconds duration
    );
  }
}
