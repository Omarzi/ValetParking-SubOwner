import 'package:valetparking_subowner/common/widgets/switches/switch_widget.dart';
import 'package:valetparking_subowner/features/profile/presentation/widgets/change_language_widget.dart';
import 'package:valetparking_subowner/features/profile/presentation/widgets/profile/logout_widget.dart';
import 'package:valetparking_subowner/features/profile/presentation/widgets/profile/remove_account_widget.dart';
import 'package:valetparking_subowner/utils/constants/exports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? _selectedImageToPerson;

  @override
  Widget build(BuildContext context) {
    List<String> listTilTextInProfile =
        VConstants.listTilKeysInProfile.map((key) {
      return AppLocalizations.of(context)!.translate(key)!;
    }).toList();

    List<String> listTilIconsInProfile = VConstants.listTilIconsInProfile;

    bool isDarkModeEnabled = false;
    bool isOnNotificationEnabled = false;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundImage: const AssetImage(VImages.profileImage),
                      ),
                      // Positioned(
                      //   right: -3.w,
                      //   bottom: 0.h,
                      //   child: SvgPicture.asset(VImages.editIcon),
                      // ),
                    ],
                  ),

                  /// Make Space
                  SizedBox(height: 12.h),

                  /// Full Name
                  Text(VCacheHelper.getString(key: CacheKeys.email)!, style: VStyles.h4Bold(context)),
                  // Text('Omar AbdelAziz', style: VStyles.h4Bold),

                  /// Make Space
                  // SizedBox(height: 8.h),

                  // / Email Address
                  // Text('omar_abdelaziz@gmail.com',
                  //     style: VStyles.bodyMediumSemiBold),

                  /// Make Space
                  SizedBox(height: 24.h),

                  Container(height: 1.4.h, color: VColors.greyScale200),

                  /// Make Space
                  SizedBox(height: 24.h),

                  /// ListTil
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: List.generate(
                        /// Use the smaller length between the two lists
                        listTilTextInProfile.length <
                                listTilIconsInProfile.length
                            ? listTilTextInProfile.length
                            : listTilIconsInProfile.length,
                        (index) {
                          return ListTile(
                            onTap: () => navigateBasedOnIndex(context, index),
                            contentPadding: EdgeInsets.zero,
                            leading: SvgPicture.asset(
                              VConstants.listTilIconsInProfile[index],
                              width: 28.w,
                              height: 28.h,
                              fit: BoxFit.scaleDown,
                            ),
                            title: Text(
                              listTilTextInProfile[index],
                              style: VStyles.bodyXLargeSemiBold(context),
                            ),
                            trailing: SizedBox(
                              width: 160.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  index == 1
                                      ? Text(
                                          AppLocalizations.of(context)!
                                                  .isEnLocale
                                              ? 'English (US)'
                                              : 'العربية',
                                          style: VStyles.bodyXLargeSemiBold(context))
                                      : const SizedBox.shrink(),
                                  index == 1
                                      ? SizedBox(width: 20.w)
                                      : const SizedBox.shrink(),
                                  SvgPicture.asset(
                                    AppLocalizations.of(context)!.isEnLocale
                                        ? VImages.arrowRightIOS2
                                        : VImages.arrowLeftIOS2,
                                    width: 20.w,
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openImageGalleryToPerson() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImageToPerson = image;
      });
    } else {
      print('No image selected');
    }
  }

  void navigateBasedOnIndex(BuildContext context, int index) {
    switch (index) {
      // case 0:
      //   context.pushNamed(VRoutesName.editProfileRoute);
      //   break;
      //   break;
      case 0:
        VDeviceUtils.showCustomBottomSheet(context: context, widget: const ChangeLanguageWidget());
        break;
      case 1:
        context.pushNamed(VRoutesName.privacyPolicyRoute);
        break;
      case 2:
        VDeviceUtils.showCustomBottomSheet(
            context: context, widget: const LogoutWidget());
      case 3:
        VDeviceUtils.showCustomBottomSheet(
            context: context, widget: const RemoveAccountWidget());
        break;
      default:
        break;
    }
  }
}
