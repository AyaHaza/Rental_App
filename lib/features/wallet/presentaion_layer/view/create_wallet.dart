import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../config/responsive.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/style.dart';
import '../../../../core/widgets_App/buttons_widget.dart';
import '../../../../core/widgets_App/textField_widget.dart';
import '../../../../injection_container.dart';
import '../../domain_layer/entities/wallet_entity.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';

TextEditingController securityCodeController = TextEditingController();
TextEditingController confiermsecurityCodeController = TextEditingController();
TextEditingController bankAkkountController = TextEditingController();
ValueNotifier<bool> valueNotifiercode = ValueNotifier(true);
ValueNotifier<bool> valueNotifierConfiermcode = ValueNotifier(true);
GlobalKey<FormState> formKey = GlobalKey();

class CreateWallet extends StatelessWidget {
  const CreateWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WalletBloc>(
      create: (context) => sl(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: white,
          body: SafeArea(
              child: Padding(
            padding: leftAndRightAndTopPadding(0.02, 0.02, 0.08),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const Center(
                      child: Text(
                    CREATEWALLET,
                    style: selectStyle,
                  )),
                  Padding(
                    padding: onlyBottomPadding(0.08),
                    child: Image.asset(
                      height: screenHight * 0.2,
                      width: screenWidth * 0.02,
                      walletImage,
                    ),
                  ),
                  Padding(
                    padding: topAndBottomPadding(0.01, 0.0),
                    child: ValueListenableBuilder(
                        valueListenable: valueNotifiercode,
                        builder: (context, value, child) {
                          return TextFieldCustom(
                              white,
                              IconButton(
                                  onPressed: () {
                                    valueNotifiercode.value =
                                        !valueNotifiercode.value;
                                  },
                                  icon: (value == true)
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: subtitleColor,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: darkGreenColor,
                                        )),
                              SizedBox(),
                              ENTERYOURSECURITYCODE,
                              securityCodeController,
                              TextInputType.name,
                              1,
                              (v) {},
                              () {},
                              valueNotifiercode.value);
                        }),
                  ),

                  Padding(
                    padding: topAndBottomPadding(0.01, 0.0),
                    child: ValueListenableBuilder(
                        valueListenable: valueNotifierConfiermcode,
                        builder: (context, value, child) {
                          return TextFieldCustom(
                              white,
                              IconButton(
                                  onPressed: () {
                                    valueNotifierConfiermcode.value =
                                        !valueNotifierConfiermcode.value;
                                  },
                                  icon: (value == true)
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: subtitleColor,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: darkGreenColor,
                                        )),
                              SizedBox(),
                              ENTERYOURSCODEAGIN,
                              confiermsecurityCodeController,
                              TextInputType.name,
                              1,
                              (v) {},
                              () {},
                              valueNotifierConfiermcode.value);
                        }),
                  ),

                  Padding(
                    padding: topAndBottomPadding(0.01, 0.01),
                    child: TextFieldCustom(
                        white,
                        SizedBox(),
                        SizedBox(),
                        ENTERYOURBANKACCOUNT,
                        bankAkkountController,
                        TextInputType.emailAddress,
                        1,
                        null,
                        null,
                        true),
                  ),
                  // Padding(
                  //   padding:leftAndRightAndTBottomPadding(0.05, 0, 0.04),
                  //   child: Row(children: [Text("Did you have Wallet?",style: TextStyle(color: titelColor,fontSize: 13),),InkWell(onTap: (){Navigator.pushNamed(context,'/WalletInfo' );},child: Text(" Click here ",style: TextStyle(color: lightGreen,fontSize: 14),)),Text("to go to your Wallet",style: TextStyle(color: titelColor,fontSize: 13),)],),
                  // ),
                  Padding(
                    padding: onlyTopPadding(0.04),
                    child: ButtonCustom(
                        2,
                        screenWidth * 0.8,
                        screenHight * 0.06,
                        BlocBuilder<WalletBloc, WalletState>(
                          builder: (context, state) {
                            if (state is WalletInitial) {
                              return const Text(
                                CONFIRM,
                                style: TextStyle(color: white, fontSize: 18),
                              );
                            } else if (state is LoadingState) {
                              return const CupertinoActivityIndicator(
                                color: white,
                              );
                            } else if (state is ErrorState) {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  text: state.failure,
                                  confirmBtnColor: darkRedColor,
                                );
                              });
                              return const Text(
                                CONFIRM,
                                style: TextStyle(color: white, fontSize: 18),
                              );
                            } else if (state is SuccessState) {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                Navigator.pushNamed(context, '/WalletInfoAndCode');
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  text: 'Create Wallet Completed Successfully!',
                                  confirmBtnColor: darkGreenColor,
                                );
                              });
                              return const Text(
                                CONFIRM,
                                style: TextStyle(color: white, fontSize: 18),
                              );
                            }
                            return const SizedBox();
                          },
                        ),
                        darkGreenColor,
                        darkGreenColor,
                        () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          formKey.currentState!.save();
                          print(securityCodeController.text);
                          print(confiermsecurityCodeController.text);
                          print(bankAkkountController.text);
                          WalletEntity walletEntity = WalletEntity(
                                  securityCode: securityCodeController.text,
                                  confirmSecurityCode: confiermsecurityCodeController.text,
                                  bankAccount: bankAkkountController.text
                                  );
                          context
                              .read<WalletBloc>()
                              .add(CreateWalletEvent(walletEntity));
                        }),
                  )
              
                ],
              ),
            ),
          )),
        );
      }),
    );
  }
}
