import 'package:world_times_app/core/extensions/network_extension.dart';
import 'package:world_times_app/core/network/network_manager.dart';
import 'package:world_times_app/feature/secondary/model/world_time_model.dart';

class WorldTimeService {
  Future<WorldTimeModel?> fetchWorldTime(String timezone) async {
    try {
      final response = await NetworkManager.instance.dioGet(
        endPoint: NetworkRoute.TIMEZONE_URL.rawValue! + "/$timezone",
      );
      final allData = WorldTimeModel.fromJson(response.data);
      print(allData.timezone);
      return allData;
    } catch (e) {
      throw Exception(e);
    }
  }
}
