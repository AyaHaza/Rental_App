import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../injection_container.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';
import 'show_or_rental4.dart';

class SelectTransport extends StatelessWidget {
  int hubId;
  SelectTransport({required this.hubId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReservationBloc>(
      create: (context) => sl()..add(getBicycleCategory()),
      child:  Builder(
        builder: (context) {
          return Scaffold(
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
                        Padding(
                          padding: onlyLeftPadding(0.14),
                          child: const Text(selectTransport,style: TextStyle(fontSize:20 ),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.02,0.04),
                    child: Center(child: const Text(selectYourTransport,style: TextStyle(fontSize:32 ,fontWeight: FontWeight.w500),)),
                  ),
                  Padding(
                    padding: leftAndRightPadding(0.04, 0.04),
                    child: BlocBuilder<ReservationBloc,ReservationStates>(
                      builder: (context,state) {
                        if(state is SuccessState){
                          return Container(
                            height: screenHight*0.78,
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 2 / 2,
                                  crossAxisSpacing: 14,
                                  mainAxisSpacing: 14
                              ),
                              itemCount: state.data.body.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: lightGreenColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: lightGreen)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(cycleImage),
                                        Text(state.data.body[index]),
                                      ],
                                    ),
                                  ),
                                  onTap: (){Navigator.pushNamed(context,'/ShowOrRental',arguments: ShowOrRental(
                                    nameTransport:state.data.body[index],
                                    hubId: hubId,
                                  ),);},
                                );
                              }
                            ),
                          );
                        }else if(state is ErrorState){
                          return  Text(state.failure);
                        }else{
                          return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                        }
                      }
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      )
    );
  }
}
