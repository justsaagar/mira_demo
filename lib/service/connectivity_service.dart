import 'package:get/get.dart';
import 'package:gym/routes/route_helper.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityService {
  ConnectivityService._privateConstructor();

  static final ConnectivityService instance = ConnectivityService._privateConstructor();

  InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
  bool isConnected = true;

  Future<bool> checkConnection() async => await internetConnectionChecker.hasConnection;

  void connectionStream() {
    internetConnectionChecker.onStatusChange.listen((InternetConnectionStatus internetConnectionStatus) {
      switch (internetConnectionStatus) {
        case InternetConnectionStatus.connected:
          isConnected = true;
          break;
        case InternetConnectionStatus.disconnected:
          isConnected = false;
          Get.offAllNamed(RouteHelper.getConnectionLostRoute());
          break;
      }
    });
  }

  Future<bool> isConnectNetworkWithMessage() async {
    isConnected = await internetConnectionChecker.hasConnection;
    if (!isConnected) Get.offAllNamed(RouteHelper.getConnectionLostRoute());
    return isConnected;
  }
}
