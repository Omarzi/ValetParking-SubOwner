import 'package:valetparking_subowner/utils/constants/exports.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({super.key});

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'All users',
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
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    // color: Colors.white,
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
                            backgroundImage:
                                const AssetImage(VImages.profileImage),
                          ),

                          /// Make Space
                          SizedBox(width: 12.w),

                          /// User data
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Omar Abdelaziz',
                                style: VStyles.bodyMediumSemiBold(context).copyWith(
                                  color: VColors.primaryColor500,
                                ),
                              ),
                              Text(
                                'omar@gmail.com',
                                style: VStyles.bodySmallMedium(context),
                              ),
                            ],
                          ),

                          const Spacer(),

                          /// Arrow button
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 22.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 18.h),

                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    // color: Colors.white,
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
                            backgroundImage:
                            const AssetImage(VImages.profileImage),
                          ),

                          /// Make Space
                          SizedBox(width: 12.w),

                          /// User data
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Omar Abdelaziz',
                                style: VStyles.bodyMediumSemiBold(context).copyWith(
                                  color: VColors.primaryColor500,
                                ),
                              ),
                              Text(
                                'omar@gmail.com',
                                style: VStyles.bodySmallMedium(context),
                              ),
                            ],
                          ),

                          const Spacer(),

                          /// Arrow button
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 22.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
