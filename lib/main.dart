import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_mobile_dev/calculate_number/presentation/bloc/calculate_bloc.dart';
import 'package:test_mobile_dev/calculate_number/presentation/pages/main_page.dart';
import 'package:test_mobile_dev/core/services/dependency_container.dart';
import 'package:test_mobile_dev/core/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CalculateBloc>(),
      child: ScreenUtilInit(
        designSize: const Size(412, 732),
        minTextAdapt: true,
        builder: (context, child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.currentTheme,
            home: const MainPage(),
          ),
        ),
      ),
    );
  }
}
