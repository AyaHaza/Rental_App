import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import '../../../config/hive_config.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/widgets_App/buttons_widget.dart';
import '../../../core/widgets_App/textField_widget.dart';
import '../../../models/changePassword_model.dart';
import '../bloc/setting_bloc.dart';

ValueNotifier<bool> valueNotifierOldPassword = ValueNotifier(true);
ValueNotifier<bool> valueNotifierNewPassword = ValueNotifier(true);
ValueNotifier<bool> valueNotifierConfirmPassword = ValueNotifier(true);
TextEditingController oldPasswordController = TextEditingController();
TextEditingController newPasswordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey();

class Changepassword extends StatelessWidget {
  const Changepassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: white,
          body: Form(
            key: formKey,
            child: Padding(
              padding: leftAndRightAndTopPadding(0.03, 0.03, 0.02),
              child: ListView(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      const Text(back),
                      Padding(
                        padding: onlyLeftPadding(0.1),
                        child: const Text(
                          CHANGEPASSWORD,
                          style: titel,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: TopAndBottomPadding(0.03, 0.025),
                    child: ValueListenableBuilder(
                        valueListenable: valueNotifierOldPassword,
                        builder: (context, value, child) {
                          return TextFieldCustom(
                              white,
                              IconButton(
                                  onPressed: () {
                                    valueNotifierOldPassword.value =
                                        !valueNotifierOldPassword.value;
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
                              OLDPASSWORD,
                              oldPasswordController,
                              TextInputType.name,
                              1,
                              (v) {},
                              () {},
                              valueNotifierOldPassword.value);
                        }),
                  ),
                  Padding(
                    padding: TopAndBottomPadding(0, 0.025),
                    child: ValueListenableBuilder(
                        valueListenable: valueNotifierNewPassword,
                        builder: (context, value, child) {
                          return TextFieldCustom(
                              white,
                              IconButton(
                                  onPressed: () {
                                    valueNotifierNewPassword.value =
                                        !valueNotifierNewPassword.value;
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
                              NEWPASSSWORD,
                              newPasswordController,
                              TextInputType.name,
                              1,
                              (v) {},
                              () {},
                              valueNotifierNewPassword.value);
                        }),
                  ),
                  Padding(
                    padding: TopAndBottomPadding(0, 0.025),
                    child: ValueListenableBuilder(
                        valueListenable: valueNotifierConfirmPassword,
                        builder: (context, value, child) {
                          return TextFieldCustom(
                              white,
                              IconButton(
                                  onPressed: () {
                                    valueNotifierConfirmPassword.value =
                                        !valueNotifierConfirmPassword.value;
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
                              CONFIRMPASSWORD,
                              confirmPasswordController,
                              TextInputType.name,
                              1,
                              (v) {},
                              () {},
                              valueNotifierConfirmPassword.value);
                        }),
                  ),
                  Padding(
                    padding: leftAndRightPadding(0.03, 0.03),
                    child: ButtonCustom(
                        2,
                        screenWidth * 0.8,
                        screenHight * 0.06,
                        BlocBuilder<SettingBloc, SettingState>(
                          builder: (context, state) {
                            if (state is SettingInitial) {
                              return const Text(
                                SAVE,
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
                                SAVE,
                                style: TextStyle(color: white, fontSize: 18),
                              );
                            } else if (state is SuccessState) {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                Navigator.pop(context);
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  text: CHANGEPASSWORDSUCCESSFULLY,
                                  confirmBtnColor: darkGreenColor,
                                );
                              });
                              return const Text(
                                SAVE,
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

                          ChangePasswordModel changePasswordModel =
                              ChangePasswordModel(
                                  currentPassword: oldPasswordController.text,
                                  newPassword: newPasswordController.text,
                                  confirmPassword:
                                      confirmPasswordController.text);
                          if (passwordHive!.get("password") ==
                              oldPasswordController.text) {
                            Navigator.pushNamed(context, '/Setting');
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                text: 'Your Password changed Successfully!',
                                confirmBtnColor: darkGreenColor,
                              );
                            });

                            context
                                .read<SettingBloc>()
                                .add(ChangePasswordEvent(changePasswordModel));
                          } else {
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                text:
                                    "Your Password is not the same currentPassword",
                                confirmBtnColor: darkRedColor,
                              );
                            });
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
