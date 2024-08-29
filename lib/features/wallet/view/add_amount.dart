import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:rental_app/features/wallet/bloc/wallet_bloc.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/widgets_App/buttons_widget.dart';
import '../../../core/widgets_App/listTile_widget.dart';
import '../../../core/widgets_App/textField_widget.dart';
import '../../../models/add_mony_model.dart';

TextEditingController amountController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey();

class AddAmont extends StatelessWidget {
  const AddAmont({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: white,
          body: Padding(
            padding: leftAndRightAndTopPadding(0.02, 0.02, 0.02),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: TopAndBottomPadding(0, 0.04),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Center(
                                child: Icon(Icons.arrow_back_ios))),
                        const Text(back),
                        const Spacer(),
                        Padding(
                            padding: onlyRightPadding(0.39),
                            child: const Text(
                              AMOUNT,
                              style: titel,
                            )),
                      ],
                    ),
                  ),
                  TextFieldCustom(
                      white,
                      null,
                      null,
                      ENTERAMOUNTT,
                      amountController,
                      TextInputType.emailAddress,
                      1,
                      (v) {},
                      () {},
                      false),
                  Padding(
                    padding: TopAndBottomPadding(0.02, 0.044),
                    child: const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          ADDPAYMENTMETHOD,
                          style: paymentTextStyle,
                        )),
                  ),
                  Padding(
                    padding: onlyBottomPadding(0.05),
                    child: const Text(SELECTPAYMENTMETHOUD,
                        style: selectPaymentTextStyle),
                  ),
                  ButtonCustom(
                      1,
                      screenWidth,
                      screenHight * 0.08,
                      ListTileCustom(
                          false,
                          const Text("****** **845"),
                          titelTextStyle,
                          const Text("Experies 12/26"),
                          Image.asset(visaPaypelImage),
                          null,
                          null,
                          null),
                      lightGreenColor,
                      darkGreenColor,
                      () {}),
                  Padding(
                    padding: TopAndBottomPadding(0.014, 0.014),
                    child: ButtonCustom(
                        1,
                        screenWidth,
                        screenHight * 0.08,
                        ListTileCustom(
                            false,
                            const Text("*** *** **845"),
                            titelTextStyle,
                            const Text("Experies 12/26"),
                            Image.asset(cardPaypelImage),
                            null,
                            null,
                            null),
                        lightGreenColor,
                        darkGreenColor,
                        () {}),
                  ),
                  ButtonCustom(
                      1,
                      screenWidth,
                      screenHight * 0.08,
                      ListTileCustom(
                          false,
                          const Text("**** **845"),
                          titelTextStyle,
                          const Text("Experies 12/26"),
                          Image.asset(paypelImage),
                          null,
                          null,
                          null),
                      lightGreenColor,
                      darkGreenColor,
                      () {}),
                  Padding(
                    padding: onlyTopPadding(0.014),
                    child: ButtonCustom(
                        1,
                        screenWidth,
                        screenHight * 0.08,
                        ListTileCustom(
                            false,
                            const Text("**** **845"),
                            titelTextStyle,
                            const Text("Experies 12/26"),
                            Image.asset(cashPaypalImage),
                            null,
                            null,
                            null),
                        lightGreenColor,
                        darkGreenColor,
                        () {}),
                  ),
                  Padding(
                    padding: leftAndRightAndTopPadding(0.04,0.04, 0.03),
                    child: ButtonCustom(
                        0,
                        screenWidth,
                        screenHight * 0.07,
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
                                  text: 'Add Money Successfully!',
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
                          AddMonyModel addMonyModel =
                              AddMonyModel(code: amountController.text);
                          context
                              .read<WalletBloc>()
                              .add(EditeWalletEvent(addMonyModel));
                    
                          print(amountController.text);
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
