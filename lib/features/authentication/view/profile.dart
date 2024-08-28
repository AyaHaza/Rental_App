

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import '../../../config/hive_config.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/widgets_App/buttons_widget.dart';
import '../../../core/widgets_App/textField_widget.dart';
import '../../../models/user_model.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';
import 'set_password.dart';


// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController fitrstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  TextEditingController mobailController=TextEditingController();
  TextEditingController birthDateeController= TextEditingController();
  DateTime birthDateController=  new DateTime.timestamp();
  GlobalKey<FormState> formKey = GlobalKey();
  Country country=CountryParser.parseCountryCode('SY');
  bool isDateSelected = false;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(ProfileEvent(userHive!.get("username"))),
      child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: white,
              body: BlocConsumer<AuthBloc,AuthStates>(
                builder: (context,state) {
                if(state is SuccessStatee){
                  return Form(
                    key: formKey,
                    child: ListView(
                      children: [
                        Padding(
                          padding: leftAndRightAndTopAndTBottomPadding(0.04,0.04,0.06, 0.02),
                          child: const Text(editprofile,style: TextStyle(fontSize:32 ,fontWeight: FontWeight.w500),),
                        ),
                        Padding(
                          padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                          child: TextFieldCustom(white, const SizedBox(),const SizedBox(), state.data.firstName, fitrstNameController, TextInputType.name, 1,(v){},(){},false),
                        ),
                        Padding(
                          padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                          child: TextFieldCustom(white, const SizedBox(),const SizedBox(), state.data.lastName, lastNameController, TextInputType.emailAddress, 1,(v){},(){},false),
                        ),
                        Padding(
                          padding:  leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                          child: TextFieldCustom(white, const SizedBox(),InkWell(child: Container(width: 108,alignment: Alignment.center,child: Row(
                            children: [
                              Text('    ${country.flagEmoji}'),
                              const Icon(Icons.keyboard_arrow_down_outlined),
                              Text('|  +${country.phoneCode}')
                            ],
                          ),),onTap: (){
                            showCountryPicker(context: context, onSelect: (country){setState(() {this.country=country; });},countryListTheme: CountryListThemeData(bottomSheetHeight: 600,searchTextStyle: const TextStyle(color: darkGreenColor),borderRadius: BorderRadius.circular(8),inputDecoration: const InputDecoration(hintText: searchCountryHere ,prefixIcon: Icon(Icons.search,color: darkGreenColor,),)));
                          },), state.data.phone, mobailController, TextInputType.number, 1,(phoneNumber){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('+${country.flagEmoji} $phoneNumber')
                                )
                            );
                          },(){},false),
                        ),
                        Padding(
                          padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                          child: TextFieldCustom(white, const SizedBox(),const SizedBox(), state.data.username, userNameController, TextInputType.name, 1,(v){},(){},false),
                        ),
                        Padding(
                          padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                          child: TextFieldCustom(white, const SizedBox(),const SizedBox(), state.data.birthDate.toString(), birthDateeController, TextInputType.name, 1,(v){},()async{
                            FocusScope.of(context).requestFocus(FocusNode());
                            final datePick = await showDatePicker(
                                context: context,
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: lightGreen, // header background color
                                        onPrimary: Colors.black, // header text color// body text color
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor: darkGreenColor, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100)
                            );

                            if (datePick != null && datePick != birthDate) {
                              setState(() {
                                final String formatter = DateFormat('yyyy-MM-dd').format(datePick);
                                birthDateController = DateTime.parse(formatter);
                                isDateSelected = true;
                                String birthDateInString ="${birthDateController.day}/${birthDateController.month}/${birthDateController.year}";
                                birthDateeController.text = birthDateInString;
                              });
                            }
                          },false),
                        ),
                        Padding(
                          padding: leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.04, 0.02),
                          child: ButtonCustom(0,0, screenHight*0.06, const Text(edit,style: TextStyle(fontSize: 26,color: white),), darkGreenColor, darkGreenColor, (){
                            // if (!formKey.currentState!.validate()) {
                            //   return;
                            // }
                            formKey.currentState!.save();
                            if(fitrstNameController.text==''||fitrstNameController.text==null){
                              fitrstNameController.text=state.data.firstName;
                            }
                            if(lastNameController.text==''||lastNameController.text==null){
                              lastNameController.text=state.data.lastName;
                            }
                            if(mobailController.text==''||mobailController.text==null){
                              mobailController.text=state.data.phone;
                            }
                            if(userNameController.text==''||userNameController.text==null){
                              userNameController.text=state.data.username;
                            }
                            if(birthDateController==''||birthDateController==null){
                              birthDateController=state.data.birthDate;
                            }
                            UserModel userModel=UserModel(firstName: fitrstNameController.text,lastName: lastNameController.text,phone: mobailController.text,username: userNameController.text,birthDate: birthDateController,password: 'avsawaQAQ1332!1',confirmPassword: 'avsawaQAQ1332!1');
                            context.read<AuthBloc>().add(EditProfileEvent(userModel));
                          }),
                        ), ],
                    ),
                  );

                }else if (state is ErrorStatee) {
                  return Text(state.failure);
                } else {
                  return Center(
                      child: CupertinoActivityIndicator(color: lightGreen,));
                }
                }, listener: (BuildContext context, AuthStates state) {
                  if(state is SuccessBoolStatee){
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      Navigator.pushNamed(context, '/ButtomNavBar');
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        text: 'Your Edited Completed Successfully!',
                        confirmBtnColor: darkGreenColor,

                      );
                    });
                  }
              },
              ),
            );
          }
      ),
    );
  }
}