import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/user_profile_model.dart';
import '../service/rest_service.dart';
import '../service/validation_utils.dart';

class ProfileInfoController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String firstNameError = '';
  String lastNameError = '';
  String mobileNumberError = '';
  String ageError = '';
  UserProfile? userProfile;
  bool isLoading = false;
  bool isSwitch = false;

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  notificationSwitch(value) {
    isSwitch = value;
    update();
  }

  Future<void> getUserProfile() async {
    try {
      final response = await RestServices.instance.getRestCall(endpoint: RestConstants.instance.showProfile);
      if (response != null && response.isNotEmpty) {
        final Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('success') && responseMap['success']) {
          userProfile = UserProfile.fromJson(responseMap['message']);
          firstNameController.text = userProfile?.name ?? '';
          lastNameController.text = userProfile?.lastName ?? '';
          emailController.text = userProfile?.email ?? '';
          mobileNumberController.text = userProfile?.mobileNo ?? '';
          ageController.text = userProfile?.dateOfBirth ?? '';
        }
      }
    } on SocketException catch (e) {
      print('Catch socket exception in getUserProfile --> ${e.message}');
    }
    update();
  }

  void validateEditProfile() {
    if (ValidationUtils.validateEmptyController(firstNameController)) {
      firstNameError = 'please enter first name';
    } else {
      firstNameError = '';
    }
    if (ValidationUtils.validateEmptyController(lastNameController)) {
      lastNameError = 'please enter last name';
    } else {
      lastNameError = '';
    }
    if (ValidationUtils.validateEmptyController(mobileNumberController)) {
      mobileNumberError = 'please enter mobile number';
    } else if (ValidationUtils.lengthValidator(mobileNumberController, 10)) {
      mobileNumberError = 'please ene valid mobile number';
    } else {
      mobileNumberError = '';
    }
    if (ValidationUtils.validateEmptyController(ageController)) {
      ageError = 'please enter age';
    } else {
      ageError = '';
    }

    if (firstNameError.isEmpty && lastNameError.isEmpty && mobileNumberError.isEmpty && ageError.isEmpty) {
      updateUserProfile();
    }
  }

  Future<void> updateUserProfile() async {
    try {
      isLoading = true;
      update();
      final Map<String, String> bodyMap = {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'mobile_no': mobileNumberController.text,
        'email': emailController.text,
        'age': ageController.text,
      };
      final response = await RestServices.instance.postRestCall(endpoint: RestConstants.instance.updateUserProfile, body: bodyMap, isFormData: true);
      if (response != null && response.isNotEmpty) {
        final Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('success') && responseMap['success']) {
          Get.back();
          responseMap['message'].toString().showSuccess();
        } else {
          responseMap['message'].toString().showError();
        }
      }
    } on SocketException catch (e) {
      print('Catch socket exception in updateUserProfile --> ${e.message}');
    }
    isLoading = false;
    update();
  }
}
