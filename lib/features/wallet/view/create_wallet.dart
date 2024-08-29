import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/widgets_App/buttons_widget.dart';
import '../../../core/widgets_App/textField_widget.dart';
import '../../../models/create_wallet_model.dart';
import '../bloc/wallet_bloc.dart';

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
    return BlocProvider(
      create: (context) => WalletBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: white,
          body: SafeArea(
              child: Padding(
            padding: leftAndRightAndTopPadding(0.04, 0.04, 0.01),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const Center(
                      child: Text(
                    CREATEWALLET,
                    style: selectStyle,
                  )),
                  Image.asset(
                    height: screenHight * 0.2,
                    width: screenWidth * 0.02,
                    walletImage,
                  ),
                  const Text(
                    SECURITYCODE,
                    style: titel,
                  ),
                  Padding(
                    padding: TopAndBottomPadding(0.01, 0.025),
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
                              null,
                              ENTERYOURSECURITYCODE,
                              securityCodeController,
                              TextInputType.name,
                              1,
                              (v) {},
                              () {},
                              valueNotifiercode.value);
                        }),
                  ),
                 
                  const Text(
                    CONFIRMSECURITYCODE,
                    style: titel,
                  ),
                  Padding(
                    padding: TopAndBottomPadding(0.01, 0.025),
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
                              null,
                              ENTERYOURSCODEAGIN,
                              confiermsecurityCodeController,
                              TextInputType.name,
                              1,
                              (v) {},
                              () {},
                              valueNotifierConfiermcode.value);
                        }),
                  ),
                  const Text(
                    BANKACCOUNT,
                    style: titel,
                  ),
                  Padding(
                    padding: TopAndBottomPadding(0.01, 0.01),
                    child: TextFieldCustom(
                        white,
                        null,
                        null,
                        ENTERYOURBANKACCOUNT,
                        bankAkkountController,
                        TextInputType.emailAddress,
                        1,
                        null,
                        null,
                        true),
                  ),
                  Padding(
                    padding:leftAndRightAndTBottomPadding(0.05, 0, 0.04),
                    child: Row(children: [Text("Did you have Wallet?",style: TextStyle(color: titelColor,fontSize: 13),),InkWell(onTap: (){Navigator.pushNamed(context,'/WalletInfo' );},child: Text(" Click here ",style: TextStyle(color: lightGreen,fontSize: 14),)),Text("to go to your Wallet",style: TextStyle(color: titelColor,fontSize: 13),)],),
                  ),
                  Padding(
                    padding: leftAndRightPadding(0.03, 0.03),
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
                                Navigator.pushNamed(context, '/WalletInfo');
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
                          CreateWalletModel createWalletModel =
                              CreateWalletModel(
                                  securityCode: securityCodeController.text,
                                  confirmSecurityCode: confiermsecurityCodeController.text,
                                  bankAccount: bankAkkountController.text
                                  );
                          context
                              .read<WalletBloc>()
                              .add(CreateWalletEvent(createWalletModel));
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
