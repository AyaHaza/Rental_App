import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rental_app/config/responsive.dart';
import 'package:rental_app/features/bicyles/bloc/states.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../models/bicycle_Supa_model.dart';
import '../bloc/bloc.dart';
import '../bloc/bloc_supa.dart';
import '../bloc/events.dart';
import 'edit_bicycle.dart';

class AllBicyles extends StatelessWidget {
  final List bicycles=[];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => BicycleBloc()..add(GetBicycleEvent())),
          BlocProvider(create: (_) => BicycleSupaBloc()),
        ],
        child: Builder(
            builder: (context) {
              bicycles.clear();
              print(bicycles);
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
                              padding: onlyLeftPadding(0.2),
                              child: const Text(allBicycles,style: TextStyle(fontSize:20 ),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: onlyTopPadding(0.02),
                        child: BlocConsumer<BicycleBloc,BicycleStates>(
                          builder: (context, state) {
                            if(state is SuccessState){
                              return BlocConsumer<BicycleSupaBloc,BicycleStates>(
                                builder: (context, stateTwo) {
                                  if(stateTwo is SuccessState){
                                    bicycles.clear();
                                    bicycles.addAll(state.data);
                                    bicycles.addAll(stateTwo.data);
                                    print(bicycles);
                                    return Container(
                                      height: screenHight*0.9,
                                      padding: onlyBottomPadding(0.02),
                                      // color: Colors.deepPurpleAccent,
                                      child: ListView.builder(
                                        itemCount: state.data.length+stateTwo.data.length,
                                        itemBuilder: (context, index) {
                                          print( state.data.contains(bicycles[index]));
                                          return Column(
                                            children: [
                                              ListTile(
                                                minTileHeight: screenHight*0.07,
                                                title: (state.data.contains(bicycles[index]))? Text(bicycles[index].modelPrice.model,style: TextStyle(fontSize: 22),):Text(bicycles[index].modelName,style: TextStyle(fontSize: 22),),
                                                subtitle: Row(
                                                  children: [
                                                    Text('T:'),
                                                    (state.data.contains(bicycles[index]))? Text(bicycles[index].type,style: TextStyle(fontSize: 12,color: subtitleColor),):Text(bicycles[index].type,style: TextStyle(fontSize: 12,color: subtitleColor),),
                                                    Text(' | P :'),
                                                    (state.data.contains(bicycles[index]))? Text(bicycles[index].modelPrice.price.toString(),style: TextStyle(fontSize: 12,color: subtitleColor),):Text(bicycles[index].price.toString(),style: TextStyle(fontSize: 12,color: subtitleColor),),
                                                    Text(' | S :'),
                                                    (state.data.contains(bicycles[index]))? Text(bicycles[index].size.toString(),style: TextStyle(fontSize: 12,color: subtitleColor),):Text(bicycles[index].size.toString(),style: TextStyle(fontSize: 12,color: subtitleColor),),

                                                  ],
                                                ),
                                                leading: Container(margin: leftAndRightPadding(0.02, 0.02),
                                                    height: screenHight*0.1,width: screenWidth*0.1,clipBehavior: Clip.antiAlias,
                                                    decoration:  BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10) // Adjust the radius as needed
                                                    ),child: (state.data.contains(bicycles[index]))?Image.network('https://${bicycles[index].photoPath}',fit: BoxFit.fill):Image.network('${bicycles[index].photoPath}',fit: BoxFit.fill)),
                                                trailing: Container(
                                                  width: screenWidth*0.234,
                                                  // color: Colors.orange,
                                                  child: Row(
                                                    children: [
                                                     (state.data.contains(bicycles[index]))? Padding(
                                                        padding: onlyLeftPadding(0.04),
                                                        child: Icon(Icons.edit_off,color: subtitleColor,size: 18,),
                                                      ): IconButton(icon:Icon(Icons.edit,color: darkGreenColor,size: 20,),onPressed: (){
                                                        print(bicycles[index].modelName);
                                                        Navigator.pushNamed(context, '/EditBicycle',arguments:  EditBicycle(
                                                          id: bicycles[index].id!,
                                                          model: bicycles[index].modelName,
                                                          pric: bicycles[index].price.toString(),
                                                          size: bicycles[index].size.toString(),
                                                          type: bicycles[index].type,
                                                          photo: bicycles[index].photoPath,
                                                        ));
                                                      },),
                                                      (state.data.contains(bicycles[index]))? Padding(
                                                        padding: onlyLeftPadding(0.06),
                                                        child: Icon(Icons.delete_forever,color: subtitleColor,size: 18,),
                                                      ):IconButton(onPressed: (){context.read<BicycleSupaBloc>().add(DeleteBicycleSupa(bicycles[index].id));} ,icon: Icon(Icons.delete,color: darkRedColor,size: 20,)),
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

                                }, listener: (BuildContext context, BicycleStates state) {
                                if(state is SuccessBoolState){
                                  context.read<BicycleBloc>().add(GetBicycleEvent());
                                  context.read<BicycleSupaBloc>().add(GetBicycleEvent());
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
                            context.read<BicycleSupaBloc>().add(GetBicycleEvent());
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
                    Navigator.pushNamed(context, '/AddBicycle');
                  },
                  child: Icon(Icons.electric_bike,color: black,),
                ),
              );
            }

        ));
  }
}
