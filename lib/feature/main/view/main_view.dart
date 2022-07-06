import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_times_app/core/extensions/context_extension.dart';
import 'package:world_times_app/feature/main/viewmodel/main_cubit.dart';
import 'package:world_times_app/feature/main/viewmodel/main_state.dart';
import 'package:world_times_app/feature/secondary/view/secondary_view.dart';
import 'package:world_times_app/product/utils/color_constants.dart';
import 'package:world_times_app/product/utils/font_sizes.dart';
import 'package:world_times_app/product/widgets/change_theme_button_widget.dart';

@immutable
class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.dynamicHeight(167 / 812)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            //* AppBar
            AppBar(
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

                  //* Time text
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
                ChangeThemeButtonWidget(),
              ],
            ),

            //* Search Textfield
            Positioned(
                left: context.dynamicWidth(33 / 375),
                right: context.dynamicWidth(33 / 375),
                top: context.dynamicHeight(167 / 812),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    //TODO Bu icon tasarımdaki ile değişecek
                    prefixIcon: Icon(Icons.search),
                    hintText: "Arama",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: FontSizes.low.size,
                      color: ColorConstants.prussianBlue,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(
                        color: context.theme.focusColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(
                        color: context.theme.focusColor,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
      //* Ülke Şehirler ListView
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.dynamicHeight(42 / 812),
          horizontal: context.dynamicWidth(33 / 375),
        ),
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MainLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: context.read<MainCubit>().fetchedTimeZones?.length,
                itemBuilder: (context, index) {
                  List? timezoneList = context.read<MainCubit>().fetchedTimeZones;
                  context.read<MainCubit>().fetchedTimeZones;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: context.dynamicHeight(10 / 812),
                    ),
                    // TODO Right Arrow Eklenecek
                    child: ListTile(
                      tileColor: context.theme.appBarTheme.backgroundColor,
                      shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      leading: Text(
                        // TODO Virgül şeklinde yazım yapılacak
                        timezoneList?[index] ?? "Null",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: FontSizes.lowmid.size,
                          color: context.theme.primaryColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SecondaryView(
                                  timezone: timezoneList?[index],
                                )));
                      },
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
