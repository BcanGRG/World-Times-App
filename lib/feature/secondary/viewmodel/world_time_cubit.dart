import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:world_times_app/feature/secondary/model/world_time_model.dart';
import 'package:world_times_app/feature/secondary/service/world_time_service.dart';
import 'package:world_times_app/feature/secondary/viewmodel/world_time_state.dart';

class WorldTimeCubit extends Cubit<WorldTimeState> {
  WorldTimeCubit({required this.service, required this.timezone})
      : super(WorldTimeInitial()) {
    _init();
  }

  final WorldTimeService service;
  final String? timezone;
  bool isLoading = false;
  WorldTimeModel? fetchedWorldTimes;

  late DateTime date;
  late String hour;
  late String minute;
  late String weekDay;
  late String weekAbbreviationOffset;
  late String allDate;

  late String area;
  late String location;

  _init() async {
    await getWorldTimes();
  }

  changeLoadingView() {
    isLoading = !isLoading;
    emit(WorldTimeLoading(isLoading));
  }

  parseDateTime(String? formattingString) {
    formattingString =
        formattingString?.replaceAll(fetchedWorldTimes?.utcOffset ?? "", "");
    print(formattingString);
    date = DateTime.parse(formattingString ?? "");
  }

  void formattedDate(DateTime date) {
    initializeDateFormatting('tr_TR', "").then((_) {
      var allHour = DateFormat.Hm('tr_TR').format(date);
      hour = allHour.split(":").first;
      minute = allHour.split(":").last;
      weekDay = DateFormat.EEEE("tr_TR").format(date);
      weekAbbreviationOffset =
          "$weekDay, ${fetchedWorldTimes?.abbreviation} ${fetchedWorldTimes?.utcOffset}";
      allDate = DateFormat.yMMMMd("tr_TR").format(date);
    });
  }

  formattedCountry(String timezone) {
    area = timezone.split("/").first;
    location = timezone.split("/").last;
  }

  Future<void> getWorldTimes() async {
    try {
      changeLoadingView();
      print("alooo");
      print(timezone);
      final worldTimesData = await service.fetchWorldTime(timezone ?? "");
      changeLoadingView();
      if (worldTimesData is WorldTimeModel) {
        fetchedWorldTimes = worldTimesData;
        // TODO fonksiyonlar birleştireblinit mi bir bak
        formattedCountry(timezone ?? "");
        parseDateTime(fetchedWorldTimes?.datetime);
        formattedDate(date);
        emit(WorldTimeCompleted());
      }
    } catch (e) {
      Exception(e);
      emit(WorldTimeError());
    }
  }
}
