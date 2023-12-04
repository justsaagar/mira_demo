import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/app/app/utills/app_utills.dart';
import 'package:gym/app/widget/app_app_bar.dart';
import 'package:gym/app/widget/app_gradiant_button.dart';
import 'package:gym/app/widget/app_image_assets.dart';
import 'package:gym/app/widget/app_text.dart';
import 'package:gym/constant/app_asset.dart';
import 'package:gym/constant/color_constant.dart';
import 'package:gym/controller/profile_info_controller.dart';
import 'package:gym/routes/route_helper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app/widget/app_custom_switch.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Scaffold(
      appBar: AppAppBar(appbarTitle: 'Profile'),
      body: GetBuilder<ProfileInfoController>(
        init: ProfileInfoController(),
        builder: (ProfileInfoController profileInfoController) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10),
            shrinkWrap: true,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColorConstant.appLightBlue.withOpacity(0.2),
                      ),
                      alignment: Alignment.center,
                      child: const AppImageAsset(image: AppAsset.dummyGirl, height: 50, width: 50),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.px).copyWith(right: 15.px),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              '${profileInfoController.userProfile?.name ?? ' '} ${profileInfoController.userProfile?.lastName ?? ' '}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            SizedBox(height: 3.px),
                            AppText(
                              profileInfoController.userProfile?.goal ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              color: AppColorConstant.appGrey,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppGradientButton(
                      onPressed: () => Get.toNamed(RouteHelper.getProfileEditRoute()),
                      title: 'Edit',
                      height: 35.px,
                      width: 80.px,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.px),
              Row(
                children: [
                  personalInfoView('${profileInfoController.userProfile?.height ?? 0}cm', 'Height'),
                  SizedBox(width: 20.px),
                  personalInfoView('${profileInfoController.userProfile?.weight ?? 0}cm', 'Weight'),
                  SizedBox(width: 20.px),
                  personalInfoView('${profileInfoController.userProfile?.dateOfBirth ?? 0}yo', 'Age'),
                ],
              ),
              SizedBox(height: 15.px),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.px, horizontal: 15.px),
                decoration: BoxDecoration(
                  color: AppColorConstant.appWhite,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: AppColorConstant.appBoxShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      'Account',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 15.px),
                    accountAndOtherView(AppAsset.personalDataIcon, 'Personal Data'),
                    accountAndOtherView(AppAsset.achievementIcon, 'Achievement'),
                    accountAndOtherView(AppAsset.activityHistoryIcon, 'Activity History'),
                    accountAndOtherView(AppAsset.workOutProgressIcon, 'Workout Progress'),
                  ],
                ),
              ),
              SizedBox(height: 10.px),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  color: AppColorConstant.appWhite,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: AppColorConstant.appBoxShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      'Notification',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 15.px),
                    Row(
                      children: [
                        AppImageAsset(image: AppAsset.popNotificationIcon, height: 20.px, width: 20.px),
                        SizedBox(width: 8.px),
                        const AppText('Pop-up Notification', fontSize: 13, color: AppColorConstant.appGrey),
                        const Spacer(),
                        CustomSwitch(
                          value: profileInfoController.isSwitch,
                          onChanged: (value) => profileInfoController.notificationSwitch(value),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.px),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.px, horizontal: 15.px),
                decoration: BoxDecoration(
                  color: AppColorConstant.appWhite,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: AppColorConstant.appBoxShadow,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      'Other',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 15.px),
                    accountAndOtherView(AppAsset.heartIcon, 'Google fit connectivity '),
                    accountAndOtherView(AppAsset.contactUsIcon, 'Contact Us'),
                    accountAndOtherView(AppAsset.privacyIcon, 'Privacy Policy'),
                    accountAndOtherView(AppAsset.settingIcon, 'Delete account', isArrow: false),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  personalInfoView(String title, String subTitle) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.px, horizontal: 15.px),
        decoration: BoxDecoration(
          color: AppColorConstant.appWhite,
          borderRadius: BorderRadius.circular(15),
          boxShadow: AppColorConstant.appBoxShadow,
        ),
        child: Column(
          children: [
            AppText(
              title,
              fontSize: 13,
              color: AppColorConstant.appLightBlue,
              fontWeight: FontWeight.w500,
            ),
            AppText(
              subTitle,
              fontSize: 13,
              color: AppColorConstant.appGrey,
            ),
          ],
        ),
      ),
    );
  }

  accountAndOtherView(String image, String title, {bool isArrow = true}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          AppImageAsset(image: image, height: 20.px, width: 20.px),
          SizedBox(width: 8.px),
          AppText(title, fontSize: 13, color: AppColorConstant.appGrey),
          const Spacer(),
          if (isArrow)
            Icon(
              Icons.chevron_right_rounded,
              size: 28,
              color: AppColorConstant.appGrey.withOpacity(0.6),
            )
        ],
      ),
    );
  }
}
