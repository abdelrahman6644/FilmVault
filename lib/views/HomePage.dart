
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Widgets/home_page_body.dart';
import 'package:movies_app/constants.dart';

class Movieapp extends StatelessWidget {
  const Movieapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
            //brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(
              color: Color(primaryColor),
            )
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: const Color(primaryColor),
            appBar: AppBar(
              title: Center(
                child: Text(
                  'Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                  ),
                ),
              ),
            ),
            body: HomeBody(),
          ),
        );
      },
    );
  }
}
