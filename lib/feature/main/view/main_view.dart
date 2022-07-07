import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_times_app/core/extensions/context_extension.dart';
import 'package:world_times_app/feature/main/service/main_service.dart';
import 'package:world_times_app/feature/main/viewmodel/main_cubit.dart';
import 'package:world_times_app/feature/main/viewmodel/main_state.dart';
import 'package:world_times_app/feature/main/widgets/timezone_search_textfield.dart';
import 'package:world_times_app/feature/main/widgets/timezones_listview.dart';
import 'package:world_times_app/product/utils/font_sizes.dart';
import 'package:world_times_app/product/widgets/change_theme_button_widget.dart';

@immutable
class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(service: MainService()),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MainLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MainCompleted) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(context.dynamicHeight(167 / 812)),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //* AppBar
                    buildAppBar(context),

                    //* Search Textfield
                    Positioned(
                        left: context.dynamicWidth(33 / 375),
                        right: context.dynamicWidth(33 / 375),
                        top: context.dynamicHeight(167 / 812),
                        child: TimezoneSeachTextField(textController: textController)),
                  ],
                ),
              ),

              //* Timezones ListView
              body: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.dynamicHeight(42 / 812),
                  horizontal: context.dynamicWidth(33 / 375),
                ),
                child: TimezonesListView(),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
      ),
      toolbarHeight: context.dynamicHeight(150 / 812),
      titleSpacing: context.dynamicWidth(33 / 375),
      title:
          //* İsim , Tarih saat
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Good morning text
          Text(
            "Günaydın, Burak Can!",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: FontSizes.lowmid.size,
              color: context.theme.primaryColor,
            ),
          ),

          //* Time texts
          Text(
            context.read<MainCubit>().time,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: FontSizes.extralarge.size,
              color: context.theme.primaryColor,
            ),
          ),
          Text(
            context.read<MainCubit>().allDate,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: FontSizes.lowmid.size,
              color: context.theme.primaryColor,
            ),
          )
        ],
      ),
      elevation: 0,
      actions: [
        //* Tema değiştirme butonu
        Padding(
          padding: EdgeInsets.only(right: context.dynamicWidth(36 / 375)),
          child: ChangeThemeButtonWidget(),
        ),
      ],
    );
  }
}
