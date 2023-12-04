import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  bool success;
  num? data;
  UserProfile? userProfile;

  UserProfileModel({
    this.success = false,
    this.data,
    this.userProfile,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        success: json["success"],
        data: json["data"],
        userProfile: UserProfile.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "message": userProfile?.toJson(),
      };
}

class UserProfile {
  num? id;
  String? name;
  String? lastName;
  String? mobileNo;
  String? email;
  dynamic gender;
  dynamic dateOfBirth;
  String? heartRate;
  dynamic weight;
  dynamic height;
  num? otp;
  dynamic goal;
  dynamic medicalCondition;
  dynamic activity;
  dynamic emailVerifiedAt;
  dynamic verificationCode;
  num? activeStatus;
  dynamic googleId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deviceToken;
  String? avatar;
  num? darkMode;
  dynamic socialId;
  dynamic messengerColor;

  UserProfile({
    this.id,
    this.name,
    this.lastName,
    this.mobileNo,
    this.email,
    this.gender,
    this.dateOfBirth,
    this.heartRate,
    this.weight,
    this.height,
    this.otp,
    this.goal,
    this.medicalCondition,
    this.activity,
    this.emailVerifiedAt,
    this.verificationCode,
    this.activeStatus,
    this.googleId,
    this.createdAt,
    this.updatedAt,
    this.deviceToken,
    this.avatar,
    this.darkMode,
    this.socialId,
    this.messengerColor,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        mobileNo: json["mobile_no"],
        email: json["email"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        heartRate: json["heart_rate"],
        weight: json["weight"],
        height: json["height"],
        otp: json["otp"],
        goal: json["goal"],
        medicalCondition: json["medical_condition"],
        activity: json["activity"],
        emailVerifiedAt: json["email_verified_at"],
        verificationCode: json["verification_code"],
        activeStatus: json["active_status"],
        googleId: json["google_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deviceToken: json["device_token"],
        avatar: json["avatar"],
        darkMode: json["dark_mode"],
        socialId: json["social_id"],
        messengerColor: json["messenger_color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "mobile_no": mobileNo,
        "email": email,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "heart_rate": heartRate,
        "weight": weight,
        "height": height,
        "otp": otp,
        "goal": goal,
        "medical_condition": medicalCondition,
        "activity": activity,
        "email_verified_at": emailVerifiedAt,
        "verification_code": verificationCode,
        "active_status": activeStatus,
        "google_id": googleId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "device_token": deviceToken,
        "avatar": avatar,
        "dark_mode": darkMode,
        "social_id": socialId,
        "messenger_color": messengerColor,
      };
}
