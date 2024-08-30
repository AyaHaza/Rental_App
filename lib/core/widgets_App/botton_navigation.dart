import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_clean_tdd/core/resources/padding.dart';
import '../../../core/resources/variable.dart';
import '../../config/hive_config.dart';
import '../../features/authentication/presentation_layer/bloc/bloc.dart';
import '../../features/authentication/presentation_layer/bloc/events.dart';
import '../../features/authentication/presentation_layer/bloc/states.dart';
import '../../injection_container.dart';
import '../resources/assets.dart';
import '../resources/color.dart';
import '../resources/string.dart';
import 'drawer_widget.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
    create: (_) =>sl()..add(ProfileEvent(userHive!.get("username"))),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: white,
            body:Stack(
              children: [
                tabs[crrentIndex],
                Builder(
                    builder: (context) {
                      return Padding(
                        padding: leftAndTopPadding(0.02, 0.036),
                        child: IconButton(onPressed: () {Scaffold.of(context).openDrawer();},style: IconButton.styleFrom(backgroundColor: lightGreen,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),)),
                            icon: Icon(Icons.format_align_justify, size: 18,color: black,)
                        ),
                      );
                    }
                ),
              ],
            ) ,
            drawer:(isGoogle==true)? DrawerCustom(user.currentUser!.displayName!,user.currentUser!.email,NetworkImage(user.currentUser!.photoUrl),
                    (){Navigator.pushNamed(context, '/History');},
                    (){Navigator.pushNamed(context, '/AboutusScreen');},
                    (){},
                    (){Navigator.pushNamed(context, '/HelpAndSupport');},
                    ()async{if(isGoogle==true){await user.disconnect();userHive!.delete("haveWallet");};Navigator.pushNamed(context, '/Register');userHive!.delete("haveWallet"); }):
            BlocBuilder<AuthBloc,AuthStates>(
                builder: (context,state) {
                  if(state is SuccessStatee){
                    return DrawerCustom(state.data.firstName,'${state.data.username}@gmail.com',AssetImage(boyImage),
                            (){Navigator.pushNamed(context, '/History');},
                            (){Navigator.pushNamed(context, '/AboutusScreen');},
                            (){},
                            (){Navigator.pushNamed(context, '/HelpAndSupport');},
                            ()async{ Navigator.pushNamed(context, '/Register');userHive!.delete("haveWallet"); });
                  }return SizedBox();
                }
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: crrentIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: white,
              selectedItemColor: darkGreenColor,
              unselectedItemColor: subtitleColor,
              iconSize: 18,
              selectedFontSize: 12,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: home,),
                BottomNavigationBarItem(icon: Icon(Icons.favorite),label: favorite),
                BottomNavigationBarItem(icon: Icon(Icons.wallet),label: wallet),
                BottomNavigationBarItem(icon: Icon(Icons.verified_outlined),label: offer),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: profile),
              ],
              onTap: (index){
                setState(() {
                  crrentIndex=index;
                });
              },
            ),
          );
        }
      ),
    );
  }
}
