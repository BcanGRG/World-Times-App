import 'package:world_times_app/core/extensions/network_extension.dart';
import 'package:world_times_app/core/network/network_manager.dart';

class MainService {
  Future<dynamic> fetchTimeZones() async {
    try {
      final response = await NetworkManager.instance
          .dioGet(endPoint: NetworkRoute.TIMEZONE_URL.rawValue!);
      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
