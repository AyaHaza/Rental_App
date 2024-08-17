import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'config/bloc_observe.dart';
import 'config/hive_config.dart';
import 'config/responsive.dart';
import 'config/routes.dart';
import 'core/widgets_App/botton_navigation.dart';
import 'features/authentication/presentation_layer/view/welcome.dart';
import 'firebase_options.dart';
import 'injection_container.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  await Hive.initFlutter();
  await setupHive();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initResponsive(context);
    print(userHive!.get("token"));
    // userHive!.delete("token");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      title: 'Rental App',
      home: (userHive!.get("token")==null || userHive!.get("token")=='')?Welcome() : ButtomNavBar(),
    );
  }
}
