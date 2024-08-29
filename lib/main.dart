import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rental_app/core/resources/color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/bloc_observe.dart';
import 'config/hive_config.dart';
import 'config/responsive.dart';
import 'config/routes.dart';
import 'core/resources/variable.dart';
import 'core/widgets_App/botton_navigation.dart';
import 'features/onBording/view/onBording.dart';
import 'features/test.dart';
import 'firebase_options.dart';
// final supabase = SupabaseClient('https://nlulvjtzewkhpsistuhf.supabase.co', apiKey);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await setupHive();
  Bloc.observer = MyBlocObserver();
  Supabase.initialize(
    url: 'https://nlulvjtzewkhpsistuhf.supabase.co',
    anonKey: apikeySupa,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initResponsive(context);
    // print(userHive!.get("token"));
    // userHive!.delete("token");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: white,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
        ),
       primaryIconTheme: IconThemeData(color: darkGreenColor)
      ),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      title: 'Rental App',
      home: (userHive!.get("token")==null || userHive!.get("token")=='')?OnBording() : ButtomNavBar(),
    );
  }
}
