import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/variable.dart';
import '../../../../core/widgets_App/buttons_widget.dart';
import '../../../../injection_container.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/photo_bloc.dart';
import '../bloc/states.dart';
import 'transport_detail.dart';

class HubContent extends StatelessWidget {
  final String nameTransport;
  final int hubId;
  HubContent({required this.nameTransport,required this.hubId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReservationBloc>(create: (context) => sl()..add(getHubContent(nameTransport,hubId)),),
        BlocProvider<ReservationPhotosBloc>(create: (context) => sl()..add(getPhotos()),),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: white,
            body: Container(
              height: double.infinity,
              width:double.infinity,
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
                    padding: leftAndRightAndTopPadding(0.06,0.02,0.02),
                    child: Text('$avaiable $nameTransport $forRide',style: TextStyle(fontSize:32 ,fontWeight: FontWeight.w500),),
                  ),
                  BlocBuilder<ReservationBloc,ReservationStates>(
                    builder:(context,state){
                      if(state is SuccessState ){
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: leftAndRightPadding(0.06,0.02),
                                child: Text('${state.data.body.bicycleList.length} $bicycleFound ',style: TextStyle(fontSize:18 ,color: subtitleColor),),
                              ),
                              Container(
                                height: screenHight*0.78,
                                child: ListView.builder(
                                  itemCount: state.data.body.bicycleList.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: screenHight*0.2,
                                      margin: leftAndRightAndTopPadding(0.02, 0.02,0.03),
                                      decoration: BoxDecoration(
                                          color: lightGreenColor,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: lightGreen)
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: leftAndBottomPadding(0.02, 0.004),
                                                    child: Text(state.data.body.bicycleList[index].modelPrice.model,style: TextStyle(fontSize: 22),),
                                                  ),
                                                  Padding(
                                                    padding: leftAndBottomPadding(0.02,0.004),
                                                    child: Row(
                                                      children: [
                                                        const Text('$type:',style: TextStyle(color: subtitleColor),),
                                                        Text(state.data.body.bicycleList[index].type,style: TextStyle(color: subtitleColor)),
                                                        const Text(' | $size:',style: TextStyle(color: subtitleColor)),
                                                        Text(state.data.body.bicycleList[index].size.toString(),style: TextStyle(color: subtitleColor)),
                                                        const Text(' | $price:',style: TextStyle(color: subtitleColor)),
                                                        Text(state.data.body.bicycleList[index].modelPrice.price.toString(),style: TextStyle(color: subtitleColor)),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: onlyLeftPadding(0.02),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.location_on,size: 12,),
                                                        Text('${distance.toInt().toString()} $meter'),
                                                      ],
                                                    ),
                                                  ),
                                                ],

                                              ),
                                              Expanded(child: BlocBuilder<ReservationPhotosBloc,ReservationStates>(
                                                builder: (context,stateTwo) {
                                                  if(stateTwo is SuccessState){
                                                    return Container(
                                                      height: screenHight*0.1,width: screenWidth*0.1,
                                                      child: ListView.builder(
                                                        itemCount: stateTwo.data.body.length,
                                                        itemBuilder: (context, index2) {
                                                          return (stateTwo.data.body[index2].id==state.data.body.bicycleList[index].photoId)?Container(margin: leftAndRightPadding(0.02, 0.02),
                                                              height: screenHight*0.1,width: screenWidth*0.1,clipBehavior: Clip.antiAlias,
                                                              decoration:  BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10) // Adjust the radius as needed
                                                              ),child: Image.network('https://${stateTwo.data.body[index2].filePath}',fit: BoxFit.fill)):SizedBox();
                                                        },
                                                      ),
                                                    );
                                                  }else if(stateTwo is ErrorState){
                                                    return  Text(stateTwo.failure);
                                                  }else{
                                                    return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                                                  }
                                                }
                                              ))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ButtonCustom(0, screenWidth*0.44, screenHight*0.05, const Text(bookLater,style: TextStyle(fontSize: 20,color: darkGreenColor),), white, darkGreenColor, (){}),
                                              ButtonCustom(0, screenWidth*0.44, screenHight*0.05, const Text(rideNow,style: TextStyle(fontSize: 20,color: white),), darkGreenColor, darkGreenColor, (){
                                                Navigator.pushNamed(context,'/BicycleDetail',arguments: BicycleDetail(
                                                    bicycleId: state.data.body.bicycleList[index].id,
                                                ),);
                                              }),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }else if(state is ErrorState){
                        return  Padding(
                          padding: leftAndRightAndTopPadding(0.05, 0.05,0.02),
                          child: Text(state.failure,style:TextStyle(color: subtitleColor),),
                        );
                      }else{
                        return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                      }
                    }
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
