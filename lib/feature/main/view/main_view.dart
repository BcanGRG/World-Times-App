import 'package:flutter/material.dart';
import 'package:world_times_app/core/extensions/context_extension.dart';
import 'package:world_times_app/product/utils/font_sizes.dart';
import 'package:world_times_app/product/widgets/change_theme_button_widget.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.dynamicHeight(167 / 812)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              toolbarHeight: context.dynamicHeight(150 / 812),
              titleSpacing: context.dynamicWidth(33 / 375),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* Good mornin text
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
                    "09 : 54",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: FontSizes.extralarge.size,
                      color: context.theme.primaryColor,
                    ),
                  ),
                  Text(
                    "8 Haziran, Çarşamba",
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
                ChangeThemeButtonWidget(),
              ],
            ),
            Positioned(
                left: context.dynamicWidth(33 / 375),
                right: context.dynamicWidth(33 / 375),
                top: context.dynamicHeight(167 / 812),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    //TODO Bu icon tasarımdaki ile değişecek
                    prefixIcon: Icon(Icons.search),
                    hintText: "Arama",
                    fillColor: Colors.red,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(
                          color: Colors.red,
                        )),
                  ),
                )),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Text("SElam"),
        ),
      ),
    );
  }
}
