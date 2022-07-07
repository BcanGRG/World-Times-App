import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_times_app/core/extensions/context_extension.dart';
import 'package:world_times_app/feature/secondary/viewmodel/world_time_cubit.dart';
import 'package:world_times_app/product/utils/color_constants.dart';
import 'package:world_times_app/product/utils/font_sizes.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
