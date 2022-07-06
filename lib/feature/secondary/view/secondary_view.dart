import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_times_app/core/extensions/context_extension.dart';
import 'package:world_times_app/feature/secondary/service/world_time_service.dart';
import 'package:world_times_app/feature/secondary/viewmodel/world_time_cubit.dart';
import 'package:world_times_app/feature/secondary/viewmodel/world_time_state.dart';
import 'package:world_times_app/product/utils/assets_constants.dart';
import 'package:world_times_app/product/utils/color_constants.dart';
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
        appBar: AppBar(
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
        ),
        body: BlocConsumer<WorldTimeCubit, WorldTimeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is WorldTimeLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                SizedBox(height: context.dynamicHeight(50 / 812)),
                //* Saat Kısmı
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: context.theme.splashColor,
                          border: Border.all(
                            color: ColorConstants.prussianBlue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          context.read<WorldTimeCubit>().hour,
                          style: TextStyle(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: FontSizes.xxlarge.size,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        ":",
                        textScaleFactor: 5,
                        style: TextStyle(
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: context.theme.splashColor,
                          border: Border.all(
                            color: ColorConstants.prussianBlue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          context.read<WorldTimeCubit>().minute,
                          style: TextStyle(
                            color: context.theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: FontSizes.xxlarge.size,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: context.dynamicHeight(28 / 812)),
                Text(
                  context.read<WorldTimeCubit>().location,
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: FontSizes.large.size,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  context.read<WorldTimeCubit>().area,
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: FontSizes.midlarge.size,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: context.dynamicHeight(10 / 812)),

                Text(
                  context.read<WorldTimeCubit>().weekAbbreviationOffset,
                  style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: FontSizes.mid.size,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
}
