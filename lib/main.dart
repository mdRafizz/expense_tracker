import 'package:expense_tracker/views/dashboard/dashboard_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'common/reusable_text.dart';
import 'data/get_categories.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent,
          ),
          fontFamily: 'ferdoka',
          useMaterial3: true,
        ),
        home: DashboardScreen(),
      ),
    );
  }
}

/// a dummy class for designing and testing multiple screen
///

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  var categories = getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableText(
                categories[i].name,
                size: 18,
                weight: FontWeight.bold,
                height: 3,
              ),
              for (var subCategories in categories[i].subCategories) ...[
                GestureDetector(
                  onTap: (){
                    if(subCategories.subCategories.isNotEmpty){
                      return;
                    }else{
                      debugPrint(subCategories.name);
                    }
                  },
                  child: ReusableText(
                    '  - ${subCategories.name}',
                    weight: FontWeight.bold,
                    size: 15.5,
                    height: 2.5,
                  ),
                ),
                if (subCategories.subCategories.isNotEmpty)
                  for (var subSubCategories in subCategories.subCategories)
                    GestureDetector(
                      onTap: (){
                        debugPrint(subSubCategories);
                      },
                      child: ReusableText(
                        '     -- $subSubCategories',
                        height: 2,
                      ),
                    ),
              ],
              Gap(8.h),
            ],
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
