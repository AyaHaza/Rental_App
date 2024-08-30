import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../injection_container.dart';
import '../bloc/events.dart';
import '../bloc/hubs_bloc.dart';
import '../bloc/hubs_supa_bloc.dart';
import '../bloc/states.dart';
import 'edit_hub.dart';

class AllHubs extends StatelessWidget {
  final location;
  final List hubs=[];
  AllHubs({required this.location});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MapHubsBloc>(create: (_) => sl()..add(GetHubsEvent(location))),
        BlocProvider<MapHubsSupaBloc>(create: (_) => sl()),
      ],
      child: Builder(
          builder: (context) {
            hubs.clear();
            return Scaffold(
              backgroundColor: white,
              body: Container(
                height: double.infinity,
                width: double.infinity,
                child: ListView(
                  children: [
                    Padding(
                      padding: leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios)),
                          const Text(back),
                          Padding(
                            padding: onlyLeftPadding(0.14),
                            child: const Text(allHubs,style: TextStyle(fontSize:20 ),),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: onlyTopPadding(0.02),
                      child: BlocConsumer<MapHubsBloc,MapStates>(
                       builder: (context, state) {
                        if(state is SuccessState){
                          return BlocConsumer<MapHubsSupaBloc,MapStates>(
                          builder: (context, stateTwo) {
                            if(stateTwo is SuccessState){
                              hubs.clear();
                              hubs.addAll(state.data);
                              hubs.addAll(stateTwo.data);
                              return Container(
                                height: screenHight*0.9,
                                padding: onlyBottomPadding(0.02),
                                // color: Colors.deepPurpleAccent,
                                child: ListView.builder(
                                  itemCount: state.data.length+stateTwo.data.length,
                                  itemBuilder: (context, index) {
                                      print( state.data.contains(hubs[index]));
                                      return Column(
                                      children: [
                                        ListTile(
                                          minTileHeight: screenHight*0.07,
                                          title: Text(hubs[index].name),
                                          subtitle: Text(hubs[index].description,style: TextStyle(fontSize: 12,color: subtitleColor),),
                                          trailing: Container(
                                            width: screenWidth*0.234,
                                            // color: Colors.orange,
                                            child: Row(
                                              children: [
                                                IconButton(onPressed: (){
                                                  Navigator.pushNamed(context,'/EditHub',arguments: EditHub(
                                                    id: hubs[index].id,
                                                    name: hubs[index].name,
                                                    desecription: hubs[index].description,
                                                    lat: hubs[index].latitude.toString(),
                                                    long: hubs[index].longitude.toString(),
                                                  ),);
                                                }, icon: Icon(Icons.edit_location_alt,color: darkGreenColor,)),
                                                (state.data.contains(hubs[index]))? Padding(
                                                  padding: onlyLeftPadding(0.03),
                                                  child: Icon(Icons.delete_forever,color: subtitleColor),
                                                ):IconButton(onPressed: (){context.read<MapHubsSupaBloc>().add(DeleteHubsSupaEvent(hubs[index].id));} ,icon: Icon(Icons.delete,color: darkRedColor)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(color: black, thickness: 0.1,)
                                      ],
                                    );
                                  },
                                ),
                              );
                            }return Center(child: CupertinoActivityIndicator(color: lightGreen,));

                          }, listener: (BuildContext context, MapStates state) {
                            if(state is SuccessBoolState){
                              context.read<MapHubsBloc>().add(GetHubsEvent(location));
                              context.read<MapHubsSupaBloc>().add(GetHubsSupaEvent());
                            }
                          },
                          );
                        }else if(state is ErrorState){
                          return  Text(state.failure);
                        }else{
                          return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                        }
                      }, listener: (context, state) {
                        if(state is SuccessState){
                          context.read<MapHubsSupaBloc>().add(GetHubsSupaEvent());
                        }
                      },),
                    )
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: lightGreen,
                elevation: 5.5,
                onPressed: (){
                  Navigator.pushNamed(context, '/AddHub');
                },
                child: Icon(Icons.add_location_alt,color: black,),
              ),
            );
          }

    ));
  }
}
