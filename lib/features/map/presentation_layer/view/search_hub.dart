import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:rental_clean_tdd/features/history/presentation_layer/bloc/states.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/variable.dart';
import '../../../../core/widgets_App/botton_navigation.dart';
import '../../../../core/widgets_App/buttons_widget.dart';
import '../../../../injection_container.dart';
import '../../../history/domain_layer/entities/history_entity.dart';
import '../../../history/presentation_layer/bloc/bloc.dart';
import '../../../history/presentation_layer/bloc/events.dart';
import '../widget/drop_down.dart';

class SraechHub extends StatelessWidget {
  GlobalKey<FormState> formKeyT = GlobalKey();
  final TextEditingController start=TextEditingController();
  final TextEditingController destination=TextEditingController();
  final LocationData youLocation;
  final List hubs;
  final List hubsSupa;
  final List allHubs=[];
  final List allHubsW=[];
   LatLng? satrtPoint;
   LatLng? destinationPoint;


  SraechHub({required this.youLocation,required this.hubs,required this.hubsSupa});

  @override
  Widget build(BuildContext context) {
    allHubs.clear();
    allHubs.add('Your location');
    allHubs.addAll(List.generate(hubs.length, (index) => hubs[index].name,));
    allHubs.addAll(List.generate(hubsSupa.length, (index) => hubsSupa[index].name,));
    print(hubsSupa.first);
    return BlocProvider<HistoryBloc>(
      create: (context) => sl()..add(GetHistoryEvent()),
      child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: white,
              body: Container(
                height: double.infinity,
                width: double.infinity,
                child: Form(
                  key: formKeyT,
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
                              child: const Text(searchForHubs,style: TextStyle(fontSize:20 ),),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: leftAndRightPadding(0.04, 0.04),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.circle_outlined,size: 18,color: darkGreenColor,),
                                Padding(
                                  padding: topAndBottomPadding(0.01, 0.006),
                                  child: Icon(Icons.circle,size: 4,color: subtitleColor.withOpacity(0.68),),
                                ),
                                Icon(Icons.circle,size: 4,color: subtitleColor.withOpacity(0.68),),
                                Padding(
                                  padding: topAndBottomPadding(0.006, 0.006),
                                  child: Icon(Icons.circle,size: 4,color: subtitleColor.withOpacity(0.68),),
                                ),
                                Icon(Icons.circle,size: 4,color: subtitleColor.withOpacity(0.68),),
                                Padding(
                                  padding:onlyTopPadding(0.01),
                                  child: Icon(Icons.location_on_outlined,size: 26,color: darkRedColor,),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: onlyRightPadding(0.04),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: onlyBottomPadding(0.02),
                                    child: DropDown(chooseStartLocation,start,List.generate(allHubs.length, (index) {
                                      print(start.text);
                                      return allHubs[index];})),
                                  ),
                                  DropDown(chooseDestinationLocation,destination,List.generate(allHubs.length, (index) {
                                    print(destination.text);
                                    return allHubs[index];})),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: leftAndRightAndTopPadding(0.14,0.04,0.02),
                        child: ButtonCustom(0,0, screenHight*0.06,const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.directions,color: darkGreenColor,),
                            Text('   $showPath',style: TextStyle(color: black,fontSize: 18),),
                          ],
                        ), subtitleColor.withOpacity(0.12), darkGreenColor.withOpacity(0.5), (){
                          formKeyT.currentState!.save();
                          print(start.value.text);
                          print(destination.value.text);
                          if(start.value.text=='Your location'){
                            satrtPoint=LatLng(youLocation.latitude!, youLocation.longitude!);
                            print(satrtPoint);
                          }
                          if(destination.value.text=='Your location'){
                            destinationPoint=LatLng(youLocation.latitude!, youLocation.longitude!);
                            print(destinationPoint);
                          }
                         if(start.value.text != 'Your location'){
                           for (int i = 0; i < hubs.length; i++) {
                             if(hubs[i].name==start.value.text){
                               satrtPoint=LatLng(hubs[i].latitude, hubs[i].longitude);
                               print(satrtPoint);
                             }
                           }
                           for (int i = 0; i < hubsSupa.length; i++) {
                             if(hubsSupa[i].name==start.value.text){
                               satrtPoint=LatLng(hubsSupa[i].latitude, hubsSupa[i].longitude);
                               print(satrtPoint);
                             }
                           }
                          }
                         if(destination.value.text != 'Your location'){
                           for (int i = 0; i < hubs.length; i++) {
                             if(hubs[i].name==destination.value.text){
                               destinationPoint=LatLng(hubs[i].latitude, hubs[i].longitude);
                               print(destinationPoint);
                             }
                           }
                           for (int i = 0; i < hubsSupa.length; i++) {
                             if(hubsSupa[i].name==destination.value.text){
                               destinationPoint=LatLng(hubsSupa[i].latitude, hubsSupa[i].longitude);
                               print(destinationPoint);
                             }
                           }
                         }
                          startPosition=satrtPoint!;
                          destinationPosition=destinationPoint!;
                          HistoryEntity historyEntity=HistoryEntity( statrPoint: start.value.text, destinationPoint: destination.value.text, id: 1);
                          context.read<HistoryBloc>().add(AddToHistoryEvent(historyEntity));
                          Navigator.pushNamedAndRemoveUntil(context, '/ButtomNavBar',(route)=>false,arguments: ButtomNavBar());
                        }),
                      ),
                      Padding(
                        padding: onlyTopPadding(0.026),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [ 
                            Padding(
                              padding: onlyLeftPadding(0.04),
                              child: Text("History",style: TextStyle(fontSize: 20,color: black.withOpacity(0.6)),),
                            ),
                            BlocConsumer<HistoryBloc,HistoryStates>(
                              builder: (context, state) {
                                if(state is SuccessState){
                                  return Container(
                                    height: screenHight*0.9,
                                    padding: onlyBottomPadding(0.02),
                                    child: ListView.builder(
                                      itemCount: state.data.length,
                                        itemBuilder : (context, index) {
                                          return Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: screenHight*0.035,
                                                    width: screenWidth*0.08,
                                                    margin: onlyLeftPadding(0.03),
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: subtitleColor.withOpacity(0.4)),
                                                    child: Icon(Icons.location_on_outlined,size: 16,),
                                                  ),
                                                  Expanded(
                                                    child: ListTile(
                                                      title: Row(
                                                        children: [
                                                          Text('From : ',style: TextStyle(color: darkGreenColor),),
                                                          Text(state.data[index].statrPoint),
                                                          Text('  --->  '),
                                                          Text('To : ',style: TextStyle(color: darkGreenColor),),
                                                          Expanded(child: Text(state.data[index].destinationPoint)),
                                                        ],
                                                      ),
                                                      trailing: IconButton(onPressed: (){context.read<HistoryBloc>().add(DeleteHistoryEvent(state.data[index].id));},icon: Icon(Icons.delete,color: darkRedColor,size: 16,),)
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(color: black, thickness: 0.1,)
                                            ],
                                          );
                                        },
                                    ),
                                  );
                                }else if(state is ErrorState){
                                  return  Text(state.failure);
                                }else{
                                  return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                                }
                              }, listener: (BuildContext context, HistoryStates state) {
                              if(state is SuccessBoolState){
                                context.read<HistoryBloc>().add(GetHistoryEvent());
                              }
                            },
                        
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        ),
    );
  }
}
