import 'package:hive_flutter/hive_flutter.dart';

Box? userHive;
Box? passwordHive;

setupHive() async {
  userHive = await Hive.openBox("User");
  passwordHive = await Hive.openBox("Password");
}
