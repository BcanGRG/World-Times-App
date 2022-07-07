import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_times_app/core/extensions/context_extension.dart';
import 'package:world_times_app/feature/main/viewmodel/main_cubit.dart';
import 'package:world_times_app/feature/secondary/view/secondary_view.dart';
import 'package:world_times_app/product/utils/assets_constants.dart';
import 'package:world_times_app/product/utils/font_sizes.dart';

class TimezonesListView extends StatelessWidget {
  const TimezonesListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? timezoneListLength = context.read<MainCubit>().searchedTimeZones?.length;
    List? timezoneList = context.read<MainCubit>().searchedTimeZones;

    return timezoneListLength != 0
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: timezoneListLength,
            itemBuilder: (context, index) {
              String timezoneText =
                  (timezoneList?[index] as String).replaceAll("/", ", ");
              return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: context.dynamicHeight(10 / 812),
                  ),
                  child: buildListTile(context, timezoneText, timezoneList, index));
            },
          )
        : Center(
            child: Text(
              "Sonuç Bulunamadı",
              style: TextStyle(
                color: context.theme.primaryColor,
                fontSize: FontSizes.large.size,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
  }

  ListTile buildListTile(
      BuildContext context, String timezoneText, List<dynamic>? timezoneList, int index) {
    return ListTile(
      tileColor: context.theme.appBarTheme.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      leading: Text(
        timezoneText,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: FontSizes.lowmid.size,
          color: context.theme.primaryColor,
        ),
      ),
      trailing: Image.asset(
        AssetsConstants.arrowRightIcon,
        color: context.theme.primaryColor,
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SecondaryView(
                  timezone: timezoneList?[index],
                )));
      },
    );
  }
}
