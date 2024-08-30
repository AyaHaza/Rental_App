import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_clean_tdd/config/hive_config.dart';
import 'package:rental_clean_tdd/features/favorite/presentation_layer/bloc/events.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/variable.dart';
import '../../../../core/widgets_App/buttons_widget.dart';
import '../../../../injection_container.dart';
import '../../../favorite/presentation_layer/bloc/bloc.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';

class BicycleDetail extends StatelessWidget {
  final int bicycleId;
  final ValueNotifier<bool> valueNotifierFav = ValueNotifier(true);
  BicycleDetail({required this.bicycleId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReservationBloc>(create: (context) => sl()..add(getBicycleDetail(bicycleId)),),
        BlocProvider<FavouriteBloc>(create: (context) => sl(),),
      ],
      child: Scaffold(
        backgroundColor: white,
        body: Container( 
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              Padding(
                padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                child: Row(
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios)),
                    const Text(back),
                    Spacer(),
                    ValueListenableBuilder(
                        valueListenable: valueNotifierFav,
                        builder: (context, value, child){
                          print(userHive!.get('fav').toString());
                          return (!userHive!.get('fav').toString().contains(bicycleId.toString()))?IconButton(onPressed: (){valueNotifierFav.value=!valueNotifierFav.value;userHive!.put('fav',[bicycleId]);context.read<FavouriteBloc>().add(AddToFavorite(bicycleId));}, icon: Icon(Icons.favorite_border,),):IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: darkRedColor,));
                        }
                    ),
                  ],
                ),
              ),
              BlocBuilder<ReservationBloc,ReservationStates>(
                builder:(context,state){
                  if(state is SuccessState){
                    return Container(
                      height: screenHight*0.9,
                      child: ListView(
                        children: [
                          Padding(
                            padding: leftAndBottomPadding(0.02, 0.001),
                            child: Text(state.data.body.modelPrice.model,style: TextStyle(fontSize: 26),),
                          ),
                          Padding(
                            padding: leftAndBottomPadding(0.02, 0.01),
                            child: const Row(
                              children: [
                                Icon(Icons.star,color: lightYellowColor,size: 16,),
                                Text(reviews),
                              ],
                            ),
                          ),
                          Padding(
                            padding: onlyBottomPadding(0.02),
                            child: Container(
                              height: screenHight*0.28,
                              width: screenWidth*0.2,
                                margin: leftAndRightPadding(0.04, 0.04),
                                clipBehavior: Clip.antiAlias,
                                decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(10) // Adjust the radius as needed
                                ),child: Image.network('https://${state.data.body.photoPath}',fit: BoxFit.fill)
                            ),
                          ),
                          Padding(
                            padding: leftAndBottomPadding(0.02, 0.01),
                            child: const Text(specifications,style: TextStyle(fontSize: 16)),
                          ),
                          Padding(
                            padding: onlyBottomPadding(0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(height: screenHight*0.06,width: screenWidth*0.14,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: darkGreenColor),color: lightGreenColor),child: Icon(Icons.battery_charging_full_outlined),),
                                Container(height: screenHight*0.06,width: screenWidth*0.14,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: darkGreenColor),color: lightGreenColor),child: Icon(Icons.local_gas_station_outlined),),
                                Container(height: screenHight*0.06,width: screenWidth*0.14,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: darkGreenColor),color: lightGreenColor),child: Icon(Icons.speed_outlined),),
                                Container(height: screenHight*0.06,width: screenWidth*0.14,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: darkGreenColor),color: lightGreenColor),child: Icon(Icons.accessibility_sharp),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: leftAndBottomPadding(0.02, 0.01),
                            child: const Text(carFeatures,style: TextStyle(fontSize: 16)),
                          ),
                          Container(padding: leftAndRightPadding(0.03, 0.03),margin: leftAndRightAndTBottomPadding(0.02, 0.02, 0.006),height: screenHight*0.05,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: darkGreenColor),color: lightGreenColor),child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(model),
                              Text(state.data.body.modelPrice.model),
                            ],
                          ),),
                          Container(padding: leftAndRightPadding(0.03, 0.03),margin: leftAndRightAndTopAndTBottomPadding(0.02, 0.02, 0.006, 0.006),height: screenHight*0.05,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: darkGreenColor),color: lightGreenColor),child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(typeBike),
                              Text(state.data.body.type),
                            ],
                          ),),
                          Container(padding: leftAndRightPadding(0.03, 0.03),margin: leftAndRightAndTopAndTBottomPadding(0.02, 0.02, 0.006, 0.006),height: screenHight*0.05,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: darkGreenColor),color: lightGreenColor),child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(priceBike),
                              Text(state.data.body.modelPrice.price.toString()),
                            ],
                          ),),
                          Container(padding: leftAndRightPadding(0.03, 0.03),margin: leftAndRightAndTopAndTBottomPadding(0.02, 0.02, 0.006, 0.006),height: screenHight*0.05,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: darkGreenColor),color: lightGreenColor),child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(sizeBike),
                              Text(state.data.body.size.toString()),
                            ],
                          ),),
                          Container(padding: leftAndRightPadding(0.03, 0.03),margin: leftAndRightAndTopAndTBottomPadding(0.02, 0.02, 0.006, 0.006),height: screenHight*0.05,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: darkGreenColor),color: lightGreenColor),child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(noteBike),
                              Text(state.data.body.note),
                            ],
                          ),),
                          Padding(
                            padding: onlyTopPadding(0.018),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ButtonCustom(0, screenWidth*0.44, screenHight*0.05, const Text(bookLater,style: TextStyle(fontSize: 20,color: darkGreenColor),), white, darkGreenColor, (){}),
                                ButtonCustom(0, screenWidth*0.44, screenHight*0.05, const Text(rideNow,style: TextStyle(fontSize: 20,color: white),), darkGreenColor, darkGreenColor, (){}),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }else if(state is ErrorState){
                    return  Text(state.failure);
                  }else{
                    return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                  }
                } 
              )
            ],
          ),
        ),
      ),
    );
  }
}
