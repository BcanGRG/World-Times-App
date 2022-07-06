import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_times_app/feature/main/service/main_service.dart';
import 'package:world_times_app/feature/main/viewmodel/main_state.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({required this.service}) : super(MainInitial()) {
    _init();
  }

  final MainService service;

  bool isLoading = false;

  List? fetchedTimeZones;

  DateTime now = DateTime.now();
  late String time;
  late String allDate;

  void formattedDate() {
    initializeDateFormatting('tr_TR', "").then((_) {
      time = DateFormat.Hm('tr_TR').format(now);
      allDate = DateFormat.yMMMMd("tr_TR").format(now);
    });
  }

  _init() async {
    await getTimeZones();
  }

  changeLoadingView() {
    isLoading = !isLoading;
    emit(MainLoading(isLoading));
  }

  Future<void> getTimeZones() async {
    try {
      changeLoadingView();
      final timezoneData = await service.fetchTimeZones();
      changeLoadingView();
      fetchedTimeZones = timezoneData;
      formattedDate();
      emit(MainCompleted());
    } catch (e) {
      Exception(e);
      emit(MainError());
    }
  }
}
