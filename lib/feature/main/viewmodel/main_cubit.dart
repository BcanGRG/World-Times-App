import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_times_app/feature/main/service/main_service.dart';
import 'package:world_times_app/feature/main/viewmodel/main_state.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({required this.service}) : super(MainInitial()) {
    init();
  }

  final MainService service;

  bool isLoading = false;

  List? fetchedTimeZones;
  List? searchedTimeZones;
  DateTime now = DateTime.now();
  late String time;
  late String allDate;

  init() async {
    formattedDate();
    await getTimeZones();
  }

  void formattedDate() {
    initializeDateFormatting('tr_TR', "").then((_) {
      time = DateFormat.Hm('tr_TR').format(now).replaceAll(":", " : ");
      allDate = DateFormat.yMMMMd("tr_TR").format(now);
    });
  }

  void searchTimeZones(String query) {
    final suggestions = fetchedTimeZones?.where((timezone) {
      final timezonee = timezone.toLowerCase();
      final input = query.toLowerCase();
      return timezonee.contains(input);
    }).toList();
    searchedTimeZones = suggestions;
    emit(MainCompleted());
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
      searchedTimeZones = timezoneData;
      emit(MainCompleted());
    } catch (e) {
      Exception(e);
    }
  }
}
