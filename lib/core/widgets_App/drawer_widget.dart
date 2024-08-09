import 'package:flutter/material.dart';
import '../resources/color.dart';
import '../resources/string.dart';

// ignore: non_constant_identifier_names
Widget DrawerCustom(
    String nameUser,
    String emailUser,
ImageProvider<Object> image,
void Function()? historyOnTap,
    void Function()? complainOnTap,
    void Function()? referralOnTap,
    void Function()? aboutOnTap,
    void Function()? settingOnTap,
    void Function()? helpOnTap,
    void Function()? logoutOnTap) {
  return Drawer(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
    ),
    width: 240,
    backgroundColor: white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Row(
          children: [Icon(Icons.arrow_back_ios), Text(back)],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0, top: 30, bottom: 26),
          child: Container(
              height: 80.0,
              width: 80.0,
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: lightGreen),
              child: Container(
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    //imageUser
                    // image: AssetImage(boyImage),
                    image:image,
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Text(
            nameUser,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0, bottom: 44),
          child: Text(
            emailUser,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        ListTile(
            leading: const Icon(Icons.history_edu),
            title: const Text(history),
            onTap: historyOnTap),
        const Divider(
          color: black,
          thickness: 0.1,
        ),
        ListTile(
            leading: const Icon(Icons.all_out_sharp),
            title: const Text(referral),
            onTap: referralOnTap),
        const Divider(
          color: black,
          thickness: 0.1,
        ),
        ListTile(
            leading: const Icon(Icons.album_outlined),
            title: const Text(aboutUs),
            onTap: aboutOnTap),
        const Divider(
          color: black,
          thickness: 0.1,
        ),
        ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(setting),
            onTap: settingOnTap),
        const Divider(
          color: black,
          thickness: 0.1,
        ),
        ListTile(
            leading: const Icon(Icons.question_mark_outlined),
            title: const Text(helpAndSupport),
            onTap: historyOnTap),
        const Divider(
          color: black,
          thickness: 0.1,
        ),
        ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text(logout),
            onTap: logoutOnTap),
      ],
    ),
  );
}
