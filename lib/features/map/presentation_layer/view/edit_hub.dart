import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:quickalert/quickalert.dart';
import 'package:rental_clean_tdd/features/map/presentation_layer/bloc/events.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/widgets_App/buttons_widget.dart';
import '../../../../core/widgets_App/textField_widget.dart';
import '../../../../injection_container.dart';
import '../../domain_layer/entities/hubs_entity.dart';
import '../bloc/hubs_supa_bloc.dart';
import '../bloc/states.dart';

class EditHub extends StatelessWidget {
  TextEditingController nameController=TextEditingController();
  TextEditingController desecriptionController=TextEditingController();
  TextEditingController latLongController=TextEditingController();
  TextEditingController latController=TextEditingController();
  TextEditingController longController=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  int id;
  String name;
  String desecription;
  String lat;
  String long;
  EditHub({required this.id, required this.name,required this.desecription,required this.lat,required this.long});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapHubsSupaBloc>(
        create: (context) => sl(),
        child: Builder(
            builder: (context) {
              return Scaffold(
                backgroundColor: white,
                body: Form(
                  key: formKey,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: ListView(
                      children: [
                        Padding(
                          padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                          child: Row(
                            children: [
                              IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios)),
                              const Text(back)
                            ],
                          ),
                        ),
                        Padding(
                          padding: leftAndRightAndTBottomPadding(0.04,0.02,0.02),
                          child: const Text(editHub,style: TextStyle(fontSize:32 ,fontWeight: FontWeight.w500),),
                        ),
                        Padding(
                          padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                          child: TextFieldCustom(white, const SizedBox(),const SizedBox(), name, nameController, TextInputType.name, 1,(v){},(){},false),
                        ),
                        Padding(
                          padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                          child: TextFieldCustom(white, const SizedBox(),const SizedBox(), desecription, desecriptionController, TextInputType.name, 1,(v){},(){},false),
                        ),
                        Padding(
                          padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                          child: Row(
                            children: [
                              Container(width: screenWidth*0.76,child: TextFieldCustom(white, const SizedBox(),const SizedBox(), '$lat'+' : '+'$long', latLongController, TextInputType.name, 1,(v){},(){},false)),
                              Container(width: screenWidth*0.06,child:  IconButton(onPressed: ()async{
                                var data=await addressSuggestion(latLongController.text);
                                context.read<MapHubsSupaBloc>().add(AddToListEvent(data));
                              },icon: Icon(Icons.search_rounded),)
                              ),
                              Expanded(child:
                              IconButton(icon: Icon(Icons.pin_drop,color: darkGreenColor,),onPressed: ()async{
                                var latLongPoint=await showSimplePickerLocation(
                                  context: context,
                                  isDismissible: true,
                                  title: pickAddress,
                                  textConfirmPicker: pick,
                                  zoomOption: ZoomOption(initZoom: 12),
                                  initPosition: GeoPoint(latitude: 33.510414, longitude: 36.278336),
                                );
                                print(latLongPoint);
                                latLongController.text=latLongPoint.toString();
                                latController.text=latLongPoint!.latitude.toString();
                                longController.text=latLongPoint.longitude.toString();

                              },),
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<MapHubsSupaBloc,MapStates>(
                          builder: (context,state) {
                            if(state is SuccessState){
                              return (state.data.isEmpty)?
                              Padding(
                                padding: leftAndRightAndTBottomPadding(0.04,0.02,0.02),
                                child: Text(noAddress),
                              ):
                              Container(
                                height: screenHight*0.4,
                                child: ListView.builder(
                                  itemCount: state.data.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(state.data[index].address.toString()),
                                      onTap: (){
                                        latLongController.text=state.data[index].address.toString();
                                        print(state.data[index].point.toString());
                                        latController.text=state.data[index].point.latitude.toString();
                                        longController.text=state.data[index].point.longitude.toString();
                                      },
                                    );
                                  },
                                ),
                              );
                            }return SizedBox();
                          },
                        ),
                        Align(
                          alignment:Alignment.bottomCenter,
                          child: Padding(
                            padding: leftAndRightAndTopPadding(0.0,0.0,0.04),
                            child: ButtonCustom(0,screenWidth*0.3, screenHight*0.06, BlocBuilder<MapHubsSupaBloc,MapStates>(
                              builder:(context, state) {
                                if(state is InitialState|| state is SuccessState){
                                  return const Text(edit,style: TextStyle(fontSize: 30,color: white),);
                                }else if(state is ErrorState){
                                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.error,
                                      text: state.failure,
                                      confirmBtnColor: darkRedColor ,
                                      // autoCloseDuration: Duration(seconds: 30),
                                    );
                                  });
                                  return const Text(edit,style: TextStyle(fontSize: 30,color: white),);
                                }else if(state is SuccessBoolState){
                                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                    Navigator.pushNamedAndRemoveUntil(context, '/ButtomNavBar',(route)=>false);
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.success,
                                      text: 'Your Edited Completed Successfully!',
                                      confirmBtnColor: darkGreenColor,

                                    );
                                  });
                                  return const Text(edit,style: TextStyle(fontSize: 30,color: white),);
                                }return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                              },
                            ), darkGreenColor, darkGreenColor, (){
                              // if (!formKey.currentState!.validate()) {
                              //   return;
                              // }
                              formKey.currentState!.save();
                              if(nameController.text==''||nameController.text==null){
                                nameController.text=name;
                              }
                              if(desecriptionController.text==''||desecriptionController.text==null){
                                desecriptionController.text=desecription;
                              }
                              if(latController.text==''||latController.text==null){
                                latController.text=lat;
                              }
                              if(longController.text==''||longController.text==null){
                                longController.text=long;
                              }
                              HubsEntity hubsEntity=HubsEntity(name: nameController.text,latitude: double.parse(latController.text),longitude: double.parse(longController.text),description: desecriptionController.text);
                              context.read<MapHubsSupaBloc>().add(EditHubsSupaEvent(id,hubsEntity));
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        )
    );
  }
}
