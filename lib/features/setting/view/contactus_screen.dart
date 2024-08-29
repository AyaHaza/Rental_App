import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rental_app/config/responsive.dart';
import 'package:rental_app/features/setting/bloc/setting_bloc.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/resources/style.dart';
import '../../../core/widgets_App/buttons_widget.dart';
import '../../../core/widgets_App/textField_widget.dart';
import '../../../models/contactus_model.dart';

class ContactusScreen extends StatefulWidget {
  const ContactusScreen({super.key});

  @override
  State<ContactusScreen> createState() => _ContactusScreenState();
}

class _ContactusScreenState extends State<ContactusScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  Country country = CountryParser.parseCountryCode('SY');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: BlocProvider(
        create: (context) => SettingBloc(),
        child: Builder(
          builder: (context) {
            return Form(
              key: formKey,
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
                        padding: onlyLeftPadding(0.17),
                        child: const Text(
                          CONTACTUS,
                          style: titel,
                        ),
                      ),
                    ],
                  ),
                  const Center(
                    child: Text(
                      CONYACTUSFORRIDESHARE,
                      style: titel,
                    ),
                  ),
                  Padding(
                    padding:
                        leftAndRightAndTopAndTBottomPadding(0.1, 0.08, 0.02, 0.02),
                    child: const Center(
                      child: Text(CONTACTUSDISCRIPSTION),
                    ),
                  ),
                  const Center(child: Text(CALLUS)),
                  const Center(child: Text(SUPPORTEMAIL)),
                  Center(
                    child: Padding(
                      padding: onlyTopPadding(0.02),
                      child: const Text(
                        SENDMESSAGE,
                        style: titel,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        leftAndRightAndTopAndTBottomPadding(0.03, 0.03, 0.02, 0.02),
                    child: TextFieldCustom(white, null, null, NAME, nameController,
                        TextInputType.name, 1, null, null, false),
                  ),
                  Padding(
                    padding:
                        leftAndRightAndTopAndTBottomPadding(0.03, 0.03, 0, 0.02),
                    child: TextFieldCustom(white, null, null, EMAIL,
                        emailController, TextInputType.name, 1, null, null, false),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.03, 0.03, 0.02),
                    child: TextFieldCustom(
                        white,
                        const SizedBox(),
                        InkWell(
                          child: Container(
                            width: 108,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Text('    ${country.flagEmoji}'),
                                const Icon(Icons.keyboard_arrow_down_outlined),
                                Text('|  +${country.phoneCode}')
                              ],
                            ),
                          ),
                          onTap: () {
                            showCountryPicker(
                                context: context,
                                onSelect: (country) {
                                  setState(() {
                                    this.country = country;
                                  });
                                },
                                countryListTheme: CountryListThemeData(
                                    bottomSheetHeight: 600,
                                    searchTextStyle:
                                        const TextStyle(color: darkGreenColor),
                                    borderRadius: BorderRadius.circular(8),
                                    inputDecoration: const InputDecoration(
                                      hintText: searchCountryHere,
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: darkGreenColor,
                                      ),
                                    )));
                          },
                        ),
                        youMobailNumber,
                        phoneController,
                        TextInputType.number,
                        1, (phoneNumber) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('+${country.flagEmoji} $phoneNumber')));
                    }, () {}, false),
                  ),
                  Padding(
                    padding:
                        leftAndRightAndTopAndTBottomPadding(0.03, 0.03, 0, 0.03),
                    child: TextFieldCustom(
                        white,
                        null,
                        null,
                        WRITEYOURMESSAGE,
                        messageController,
                        TextInputType.name,
                        5,
                        null,
                        null,
                        false),
                  ),
                  Padding(
                    padding: leftAndRightPadding(0.045, 0.045),
                    child: ButtonCustom(
                        0,
                        screenWidth,
                        screenHight * 0.065,
                       BlocBuilder<SettingBloc, SettingState>(
                          builder: (context, state) {
                            if (state is SettingInitial) {
                              return  const Text(
                          SENDMESSAGE,
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
                              return const  Text(
                          SENDMESSAGE,
                          style: TextStyle(color: white, fontSize: 18),
                              );
                            } else if (state is SuccessState) {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                Navigator.pop(context);
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  text: CONTACTUSSUCCESSFULLY,
                                  confirmBtnColor: darkGreenColor,
                                );
                              });
                              return const  Text(
                          SENDMESSAGE,
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
                         
                          ContactUsModel contactUsModel =
                              ContactUsModel(name: nameController.text, email: emailController.text, number: phoneController.text, message: messageController.text);
                          context
                              .read<SettingBloc>()
                              .add(ContactusEvent(contactUsModel: contactUsModel));
                        }),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
