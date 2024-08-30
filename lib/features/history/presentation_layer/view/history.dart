import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../injection_container.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (context) => sl()..add(GetHistoryEvent()),
      child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: white,
              body: Container(
                height: double.infinity,
                width: double.infinity,
                child: ListView(
                  children: [
                    Padding(
                      padding: leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.01),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios)),
                          const Text(back),

                        ],
                      ),
                    ), Padding(
                      padding: onlyTopPadding(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: onlyBottomPadding(0.02),
                            child: Text("History",style: TextStyle(fontSize: 26),),
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
            );
          }
      ),
    );
  }
}
