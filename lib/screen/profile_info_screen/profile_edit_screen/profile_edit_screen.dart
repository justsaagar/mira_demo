import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym/app/app/utills/app_utills.dart';
import 'package:gym/app/widget/app_app_bar.dart';
import 'package:gym/app/widget/app_gradiant_button.dart';
import 'package:gym/app/widget/app_image_assets.dart';
import 'package:gym/app/widget/app_loader.dart';
import 'package:gym/app/widget/app_text.dart';
import 'package:gym/app/widget/app_textform_field.dart';
import 'package:gym/constant/app_asset.dart';
import 'package:gym/constant/color_constant.dart';
import 'package:gym/controller/profile_info_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return Scaffold(
      appBar: AppAppBar(appbarTitle: 'Profile'),
      body: GetBuilder<ProfileInfoController>(
        builder: (ProfileInfoController profileEditController) {
          return Stack(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10),
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColorConstant.appLightBlue.withOpacity(0.2),
                      ),
                      alignment: Alignment.center,
                      child: const AppImageAsset(image: AppAsset.dummyGirl, height: 60, width: 60),
                    ),
                  ),
                  SizedBox(height: 10.px),
                  Row(
                    children: [
                      personalInfoView('${profileEditController.userProfile?.height ?? 0}cm', 'Height'),
                      SizedBox(width: 20.px),
                      personalInfoView('${profileEditController.userProfile?.weight ?? 0}cm', 'Weight'),
                      SizedBox(width: 20.px),
                      personalInfoView('${profileEditController.userProfile?.dateOfBirth ?? 0}yo', 'Age'),
                    ],
                  ),
                  SizedBox(height: 25.px),
                  const AppText('First name', fontSize: 13, color: AppColorConstant.appGrey),
                  SizedBox(height: 5.px),
                  AppTextFormField(
                    hintText: 'First name',
                    textEditingController: profileEditController.firstNameController,
                    filedColor: AppColorConstant.appWhite,
                    isShadow: true,
                    errorText: profileEditController.firstNameError,
                  ),
                  SizedBox(height: 10.px),
                  const AppText('Last name', fontSize: 13, color: AppColorConstant.appGrey),
                  SizedBox(height: 5.px),
                  AppTextFormField(
                    hintText: 'Last name',
                    textEditingController: profileEditController.lastNameController,
                    filedColor: AppColorConstant.appWhite,
                    isShadow: true,
                    errorText: profileEditController.lastNameError,
                  ),
                  SizedBox(height: 10.px),
                  const AppText('Email', fontSize: 13, color: AppColorConstant.appGrey),
                  SizedBox(height: 5.px),
                  AppTextFormField(
                    hintText: 'Email',
                    textEditingController: profileEditController.emailController,
                    filedColor: AppColorConstant.appWhite,
                    isShadow: true,
                    readOnly: true,
                    errorText: '',
                  ),
                  SizedBox(height: 10.px),
                  const AppText('Mobile Number', fontSize: 13, color: AppColorConstant.appGrey),
                  SizedBox(height: 5.px),
                  AppTextFormField(
                    hintText: 'Mobile Number',
                    textEditingController: profileEditController.mobileNumberController,
                    filedColor: AppColorConstant.appWhite,
                    isShadow: true,
                    readOnly: true,
                    errorText: profileEditController.mobileNumberError,
                  ),
                  SizedBox(height: 10.px),
                  const AppText('Age', fontSize: 13, color: AppColorConstant.appGrey),
                  SizedBox(height: 5.px),
                  AppTextFormField(
                    hintText: 'Age',
                    textEditingController: profileEditController.ageController,
                    errorText: profileEditController.ageError,
                    filedColor: AppColorConstant.appWhite,
                    textInputAction: TextInputAction.done,
                    isShadow: true,
                  ),
                  SizedBox(height: 30.px),
                  AppGradientButton(
                    onPressed: () => profileEditController.validateEditProfile(),
                    title: 'Update',
                    margin: const EdgeInsets.symmetric(horizontal: 80),
                  )
                ],
              ),
              if (profileEditController.isLoading) const AppLoader(),
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
}
