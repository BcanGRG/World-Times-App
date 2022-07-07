import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_times_app/core/extensions/context_extension.dart';
import 'package:world_times_app/feature/secondary/service/world_time_service.dart';
import 'package:world_times_app/feature/secondary/viewmodel/world_time_cubit.dart';
import 'package:world_times_app/feature/secondary/viewmodel/world_time_state.dart';
import 'package:world_times_app/feature/secondary/widgets/clock_widget.dart';
import 'package:world_times_app/product/utils/assets_constants.dart';
import 'package:world_times_app/product/utils/font_sizes.dart';

class SecondaryView extends StatelessWidget {
  SecondaryView({Key? key, required this.timezone}) : super(key: key);
  final String? timezone;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WorldTimeCubit(service: WorldTimeService(), timezone: timezone),
      child: Scaffold(
        appBar: buildAppBar(context),
        body: BlocConsumer<WorldTimeCubit, WorldTimeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is WorldTimeLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                customSizedBox(context, 50),

                //* Saat Kısmı
                ClockWidget(),

                customSizedBox(context, 28),

                //* Location Text
                Text(
                  context.read<WorldTimeCubit>().location,
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: FontSizes.large.size,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //* Area Text
                Text(
                  context.read<WorldTimeCubit>().area,
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: FontSizes.midlarge.size,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                customSizedBox(context, 10),

                Text(
                  context.read<WorldTimeCubit>().weekAbbreviationOffset,
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: FontSizes.mid.size,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                //*  AllDate Text
                Text(
                  context.read<WorldTimeCubit>().allDate,
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: FontSizes.mid.size,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  SizedBox customSizedBox(BuildContext context, double size) =>
      SizedBox(height: context.dynamicHeight(size / 812));

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: context.dynamicHeight(90 / 812),
      automaticallyImplyLeading: false,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
      ),
      leading: InkWell(
        child: Image.asset(
          AssetsConstants.arrowBackIcon,
          color: context.theme.primaryColor,
        ),
        onTap: () => Navigator.of(context).pop(),
      ),
      title: Text(
        "WORLD TIME",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: FontSizes.mid.size,
          color: context.theme.primaryColor,
        ),
      ),
    );
  }
}
