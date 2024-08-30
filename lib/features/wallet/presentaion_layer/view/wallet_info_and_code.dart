import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../config/hive_config.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/style.dart';
import '../../../../core/resources/variable.dart';
import '../../../../core/widgets_App/buttons_widget.dart';
import '../../../../core/widgets_App/drawer_widget.dart';
import '../../../../core/widgets_App/listTile_widget.dart';
import '../../../../injection_container.dart';
import '../../domain_layer/entities/balance_entity.dart';
import '../bloc/bloc.dart';
import '../bloc/bloc_code.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';


class WalletInfoAndCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WalletBloc>(create: (_) =>sl()..add(GetWalletInfo())),
        BlocProvider<BlocCode>(create: (_) => sl()..add(GetAllvalidCodeEvent())),
      ],
      child: Builder(builder: (context) {
        print(userHive!.get('haveWallet').toString());
        return Scaffold(
            backgroundColor: white,
            body: Padding(
              padding: leftAndRightAndTopPadding(0.02, 0.02, 0.07),
              child: ListView(
                children: [
                      BlocConsumer<WalletBloc, WalletState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                          } else if (state is ErrorState) {
                            return Text(state.failure);
                          } else if (state is WalletInitial) {
                            return const SizedBox();
                          } else if (state is SuccessState) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  TOTALEXPANDED,
                                  style: titelTextStyle,
                                ),
                                Text(
                                  state.data.body.balance.toString()+ ' sp',
                                  style: balanceTextStyle,
                                ),
                              ],
                            );
                          }return SizedBox();
                          }, listener: (BuildContext context, WalletState state) {
                        if(state is SuccessBoolState){
                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                            Navigator.pushNamed(context, '/ButtomNavBar');
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text:'Add Money Completed Successfully!',
                              confirmBtnColor: darkGreenColor,

                            );
                          });
                        }
                      },
                      ),
                  Padding(
                    padding: topAndBottomPadding(0.03, 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          ALLVALIDCODE,
                          style: transectionTextStyle,
                        ),
                        Padding(
                          padding: onlyRightPadding(0.017),
                          child: const Text(SEEALL, style: seeAllTextStyle),
                        )
                      ],
                    ),
                  ),
                  BlocConsumer<BlocCode, WalletState>(
                      builder: (context, state) {
                        if (state is LoadingState) {
                          return Center(child: CupertinoActivityIndicator(color: lightGreen,));

                        } else if (state is ErrorState) {
                          return Text(state.failure);
                        } else if (state is WalletInitial) {
                          return const SizedBox();
                        } else if (state is SuccessState) {
                          return SizedBox(
                            width: double.infinity,
                            height: screenHight * 0.9,
                            child: ListView.builder(
                              itemCount: state.data.body.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: topAndBottomPadding(0.01, 0.01),
                                  height: screenHight * 0.08,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: lightGreen),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child:
                                    ListTile(
                                      title: Text(state.data.body[index].code),
                                      subtitle: Text(state.data.localDateTime.toString()),
                                      trailing:Text(state.data.body[index].amount.toString(), style: welltonTextStyle) ,
                                      onTap: (){
                                        BalanceEntity balanceEntity=BalanceEntity(code: state.data.body[index].code);
                                        context.read<WalletBloc>()..add(EditeWalletEvent(balanceEntity));
                                      },
                                    )
                                );
                              },
                            ),
                          );
                        }return SizedBox();
                      }, listener: (BuildContext context, WalletState state) {
                        if(state is SuccessBoolState){
                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                            Navigator.pushNamed(context, '/ButtomNavBar');
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text:'Add Money Completed Successfully!',
                              confirmBtnColor: darkGreenColor,

                            );
                          });
                        }
                  },
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
