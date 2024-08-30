import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_math/flutter_geo_math.dart';
import 'package:latlong2/latlong.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/variable.dart';
import '../../../../injection_container.dart';
import '../../../history/presentation_layer/bloc/bloc.dart';
import '../../../reservation/presentation_layer/view/select_transport.dart';
import '../bloc/hubs_bloc.dart';
import '../bloc/hubs_supa_bloc.dart';
import '../bloc/location_bloc.dart';
import '../bloc/events.dart';
import '../bloc/path_bloc.dart';
import '../bloc/states.dart';
import 'all_hubs.dart';
import 'search_hub.dart';

class MapScreen extends StatelessWidget {
  bool firstSwitchValue = false;
  TextEditingController placeController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController formController = TextEditingController();
  final MapController mapController=MapController();



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MapLocationBloc>(create: (_) => sl()..add(GetLocationEvent())),
          BlocProvider<MapHubsBloc>(create: (_) => sl()),
          BlocProvider<MapHubsSupaBloc>(create: (_) => sl()),
          BlocProvider<ShowPathBloc>(create: (_) => sl()),
          BlocProvider<HistoryBloc>(create: (_) => sl()),
        ],
        child: Builder(
            builder: (context) {
              return BlocConsumer<MapLocationBloc,MapStates>(
                  listener: (context, state) {
                    if(state is SuccessState){
                      context.read<MapHubsBloc>().add(GetHubsEvent(state.data));
                      context.read<MapHubsSupaBloc>().add(GetHubsSupaEvent());
                      context.read<ShowPathBloc>().add(ShowPathEvent(startPosition, destinationPosition));
                    }
                  },
                  builder: (context,state) {
                    if(state is SuccessState){
                      return Scaffold(
                        backgroundColor: white,
                        body:Stack(
                          children: [
                            FlutterMap(
                              mapController: mapController,
                              options: MapOptions(
                                // initialCenter: LatLng(state.data.latitude!, state.data.longitude!),
                                initialCenter: LatLng(33.510414,36.278336),
                                initialZoom: 15.0,
                                onTap: (tapPosition, point) {


                                },
                              ),
                              children: [
                                TileLayer(urlTemplate: urlTempletMap,),
                                BlocBuilder<ShowPathBloc,MapStates>(
                                    builder: (context,stateFour) {
                                      if(stateFour is SuccessState){
                                        mapController.move(stateFour.data.first, 15);
                                        return PolylineLayer(polylines: [Polyline(points: stateFour.data,strokeWidth: 12.0,color: darkGreenColor)]);
                                      }return SizedBox();
                                    }
                                ),
                                MarkerLayer(markers: [
                                  // Marker(point: LatLng(33.492,36.360),child: Icon(Icons.location_on,color: Colors.orange,size: 40,), width: 100,height: 100),
                                  Marker(point: LatLng(33.510414,36.278336), child: Icon(Icons.location_on,color: indigoAccent,size: 40,), width: 100,height: 100),
                                  Marker(point: LatLng(state.data.latitude!, state.data.longitude!), child: Icon(Icons.location_on,color:indigoAccent,size: 40,), width: 80,height: 80)
                                ]),
                                BlocBuilder<MapHubsBloc,MapStates>(
                                    builder: (context,stateTwo) {
                                      if(stateTwo is SuccessState){
                                        return MarkerLayer(markers:List.generate(stateTwo.data.length, (index) {
                                          print(stateTwo.data[index].latitude!);
                                          print(stateTwo.data[index].longitude);
                                          return Marker(
                                              point:  LatLng(stateTwo.data[index].latitude, stateTwo.data[index].longitude),
                                              child: IconButton(
                                                icon:const Icon(Icons.location_on,color: darkRedColor,size: 40,),
                                                onPressed: (){
                                                  Navigator.pushNamed(context,'/SelectTransport',arguments: SelectTransport(
                                                      hubId:stateTwo.data[index].id
                                                  ),);
                                                  print(stateTwo.data[index].id);
                                                  FlutterMapMath flutterMapMath=FlutterMapMath();
                                                  distance = flutterMapMath.distanceBetween(
                                                      state.data.latitude!,
                                                      state.data.longitude!,
                                                      stateTwo.data[index].latitude,
                                                      stateTwo.data[index].longitude,
                                                      "meters"
                                                  );
                                                },
                                              ),
                                              width: 80,
                                              height: 80
                                          );
                                        },));
                                      }return const SizedBox();
                                    }
                                ),
                                BlocBuilder<MapHubsSupaBloc,MapStates>(
                                    builder: (context,stateThree) {
                                      if(stateThree is SuccessState){
                                        return MarkerLayer(markers:List.generate(stateThree.data.length, (index) {
                                          return Marker(
                                              point:  LatLng(stateThree.data[index].latitude, stateThree.data[index].longitude),
                                              child: IconButton(
                                                icon:const Icon(Icons.location_on,color: darkRedColor,size: 40,),
                                                onPressed: (){
                                                  Navigator.pushNamed(context,'/SelectTransport',arguments: SelectTransport(
                                                      hubId:1
                                                  ),);
                                                  print(stateThree.data[index].id);
                                                  FlutterMapMath flutterMapMath=FlutterMapMath();
                                                  distance = flutterMapMath.distanceBetween(
                                                      state.data.latitude!,
                                                      state.data.longitude!,
                                                      stateThree.data[index].latitude,
                                                      stateThree.data[index].longitude,
                                                      "meters"
                                                  );
                                                },
                                              ),
                                              width: 80,
                                              height: 80
                                          );
                                        },));
                                      }return const SizedBox();
                                    }
                                ),
                              ],
                            ),
                            Padding(
                              padding: leftAndRightAndTopPadding(0.02, 0.02, 0.04),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  BlocConsumer<MapHubsBloc,MapStates>(
                                      listener: (BuildContext context, MapStates state) {
                                        if(state is SuccessState){
                                          context.read<MapHubsSupaBloc>().add(GetHubsSupaEvent());
                                        }
                                      },
                                      builder: (context,stateTwo) {
                                        if(stateTwo is SuccessState){
                                          return BlocBuilder<MapHubsSupaBloc,MapStates>(
                                              builder: (context,sateThree) {
                                                if(sateThree is SuccessState){
                                                  print(state.data);
                                                  print(stateTwo.data);
                                                  print(sateThree.data);
                                                  return InkWell(
                                                    onTap: (){Navigator.pushNamed(context, '/SraechHub',arguments: SraechHub(youLocation: state.data,hubs: stateTwo.data,hubsSupa: sateThree.data,));},
                                                    child: Container(
                                                      height: screenHight*0.046,
                                                      width: screenWidth*0.84,
                                                      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10), border: Border.all(color: black.withOpacity(0.4))),
                                                      child: Padding(
                                                        padding: onlyLeftPadding(0.02),
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons.search_rounded),
                                                              Text(searchForHubsHere,style: TextStyle(color: black.withOpacity(0.4)),),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );

                                                }return SizedBox();
                                              }
                                          );

                                        }else if (stateTwo is ErrorState) {
                                          return Text(stateTwo.failure);
                                        } else {
                                          return Container(
                                            height: screenHight*0.046,
                                            width: screenWidth*0.84,
                                            decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10), border: Border.all(color: black.withOpacity(0.4))),
                                            child: Padding(
                                              padding: onlyLeftPadding(0.02),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.search_rounded),
                                                    Text(searchForHubsHere,style: TextStyle(color: black.withOpacity(0.4)),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: rightAndTopPadding(0.04, 0.7),
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: IconButton(onPressed: () {
                                  mapController.move(LatLng(state.data.latitude!, state.data.longitude!), 15.0);
                                },
                                  icon: Icon(Icons.gps_fixed_outlined, size: 22, color: black,),
                                  style: IconButton.styleFrom(backgroundColor: lightGreen, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),minimumSize: Size(56, 56),),

                                ),
                              ),
                            ),

                          ],
                        ),

                        floatingActionButtonLocation: ExpandableFab.location,
                        floatingActionButton: ExpandableFab (
                          type: ExpandableFabType.up,
                          pos: ExpandableFabPos.right,
                          fanAngle: 180,
                          childrenAnimation: ExpandableFabAnimation.rotate,
                          distance: 50,
                          overlayStyle: ExpandableFabOverlayStyle(
                            color: Colors.black.withOpacity(0.5),
                            blur: 0.8,
                          ),
                          children:  [
                            FloatingActionButton.small(
                              heroTag: UniqueKey(),
                              onPressed: null,
                              child: Icon(Icons.notifications,color: darkGreenColor,),
                            ),
                            FloatingActionButton.small(
                              heroTag: UniqueKey(),
                              onPressed: (){
                                Navigator.pushNamed(context, '/AllHubs',arguments: AllHubs(location: state.data,));
                              },
                              child: Icon(Icons.pin_drop,color: darkGreenColor,),
                            ),
                            FloatingActionButton.small(
                              heroTag: UniqueKey(),
                              onPressed: (){
                                Navigator.pushNamed(context, '/AllBicyles');
                              },
                              child: Icon(Icons.pedal_bike,color: darkGreenColor,),
                            ),
                          ],
                        ),
                      );

                    }else if (state is ErrorState) {
                      return Text(state.failure);
                    } else {
                      return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                    }
                  }
              );
            }
        )
    );
  }
}
