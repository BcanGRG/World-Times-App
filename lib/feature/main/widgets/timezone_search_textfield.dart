import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_times_app/core/extensions/context_extension.dart';
import 'package:world_times_app/feature/main/viewmodel/main_cubit.dart';
import 'package:world_times_app/product/utils/color_constants.dart';
import 'package:world_times_app/product/utils/font_sizes.dart';

class TimezoneSeachTextField extends StatelessWidget {
  const TimezoneSeachTextField({
    Key? key,
    required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
      onChanged: context.watch<MainCubit>().searchTimeZones,
    );
  }
}
