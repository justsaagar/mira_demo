import 'package:get/get.dart';
import '../screen/login_screen/login_screen.dart';
import '../screen/on_boarding_screen/on_boarding_screen.dart';
import '../screen/splash_screen/splash_screen.dart';

class RouteHelper {
  static String getSplashRoute() => RouteConstant.initial;
  static String getLoginRoute() => RouteConstant.loginRoute;
  static String getOnBoardingRoute() => RouteConstant.onBoardingRoute;
  static String getRegisterRoute() => RouteConstant.registerRoute;
  static String getProfileRoute() => RouteConstant.profileRoute;
  static String getGoalRoute() => RouteConstant.goalRoute;
  static String getMedicalConditionRoute() => RouteConstant.medicalConditionRoute;
  static String getActivityLevelRoute() => RouteConstant.activityLevelRoute;
  static String getWelcomeRoute() => RouteConstant.welcomeRoute;
  static String getForgotPasswordRoute() => RouteConstant.forgotPasswordRoute;
  static String getVerificationRoute() => RouteConstant.verificationRoute;
  static String getResetPasswordRoute() => RouteConstant.resetPasswordRoute;
  static String getChangePasswordRoute() => RouteConstant.changePasswordRoute;
  static String getHomeScreenRoute() => RouteConstant.homeRoute;
  static String getDashBoardRoute() => RouteConstant.dashboardRoute;
  static String getNotificationRoute() => RouteConstant.notificationRoute;
  static String getInfoRoute() => RouteConstant.infoRoute;
  static String getActivityTrackerRoute() => RouteConstant.activityTrackerRoute;
  static String getProfileInfoRoute() => RouteConstant.profileInfoRoute;
  static String getChatRoute() => RouteConstant.chatRoute;
  static String getRegisterVerificationRoute() => RouteConstant.registerVerificationScreen;
  static String getProfileEditRoute() => RouteConstant.profileEditScreen;
  static String getWorkOutTrackerRoute() => RouteConstant.workOutTrackerScreen;
  static String getWantToTrainRoute() => RouteConstant.wantToTrainScreen;
  static String getConnectionLostRoute() => RouteConstant.connectionLostScreen;
  static String getStartWorkOutRoute() => RouteConstant.startWorkOutScreen;
  static String getMusicPlayerRoute() => RouteConstant.musicPlayerScreen;
  static String getCongratulationsRoute() => RouteConstant.congratulationsScreen;
  static String getScheduleWorkoutRoute() => RouteConstant.scheduleWorkoutScreen;
  static String getBreakFastRoute() => RouteConstant.breakFastScreen;
  static String getMealDetailsRoute() => RouteConstant.mealDetailsScreen;
  static String getMealScheduleRoute() => RouteConstant.mealScheduleScreen;

  static List<GetPage> routes = [
    GetPage(name: RouteConstant.initial, page: () => const SplashScreen()),
    GetPage(name: RouteConstant.loginRoute, page: () => const LoginScreen()),
    GetPage(name: RouteConstant.onBoardingRoute, page: () => const OnBoardingScreen()),
    GetPage(name: RouteConstant.registerRoute, page: () => const RegisterScreen()),
    GetPage(name: RouteConstant.profileRoute, page: () => const ProfileScreen()),
    GetPage(name: RouteConstant.goalRoute, page: () => const GoalScreen()),
    GetPage(name: RouteConstant.medicalConditionRoute, page: () => const MedicalConditionScreen()),
    GetPage(name: RouteConstant.activityLevelRoute, page: () => const ActivityLevelScreen()),
    GetPage(name: RouteConstant.welcomeRoute, page: () => const WelcomeScreen()),
    GetPage(name: RouteConstant.forgotPasswordRoute, page: () => const ForgotPasswordScreen()),
    GetPage(name: RouteConstant.verificationRoute, page: () => const VerificationScreen()),
    GetPage(name: RouteConstant.resetPasswordRoute, page: () => const ResetPasswordScreen()),
    GetPage(name: RouteConstant.changePasswordRoute, page: () => const ChangePasswordScreen()),
    GetPage(name: RouteConstant.homeRoute, page: () => const HomeScreen()),
    GetPage(name: RouteConstant.notificationRoute, page: () => const NotificationScreen()),
    GetPage(name: RouteConstant.infoRoute, page: () => const InfoScreen()),
    GetPage(name: RouteConstant.dashboardRoute, page: () => const DashBoardScreen()),
    GetPage(name: RouteConstant.activityTrackerRoute, page: () => const ActivityTrackerScreen()),
    GetPage(name: RouteConstant.profileInfoRoute, page: () => const ProfileInfoScreen()),
    GetPage(name: RouteConstant.chatRoute, page: () => const ChatScreen()),
    GetPage(name: RouteConstant.registerVerificationScreen, page: () => const RegisterVerificationScreen()),
    GetPage(name: RouteConstant.profileEditScreen, page: () => const ProfileEditScreen()),
    GetPage(name: RouteConstant.workOutTrackerScreen, page: () => const WorkOutTrackerScreen()),
    GetPage(name: RouteConstant.wantToTrainScreen, page: () => const WantToTrainScreen()),
    GetPage(name: RouteConstant.connectionLostScreen, page: () => const ConnectionLostScreen()),
    GetPage(name: RouteConstant.startWorkOutScreen, page: () => const StartWorkOutScreen()),
    GetPage(name: RouteConstant.musicPlayerScreen, page: () => const MusicPlayerScreen()),
    GetPage(name: RouteConstant.congratulationsScreen, page: () => const CongratulationsScreen()),
    GetPage(name: RouteConstant.scheduleWorkoutScreen, page: () => const ScheduleWorkoutScreen()),
    GetPage(name: RouteConstant.breakFastScreen, page: () => const BreakFastScreen()),
    GetPage(name: RouteConstant.mealDetailsScreen, page: () => const MealDetailsScreen()),
    GetPage(name: RouteConstant.mealScheduleScreen, page: () => const MealScheduleScreen()),
  ];
}
