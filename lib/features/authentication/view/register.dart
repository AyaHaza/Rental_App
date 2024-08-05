import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import '../../../config/responsive.dart';
import '../../../core/resources/color.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/string.dart';
import '../../../core/widgets_App/buttons_widget.dart';
import '../../../core/widgets_App/textField_widget.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';
import 'set_password.dart';


// ignore: use_key_in_widget_constructors
class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: white,
            body: Form(
              key: formKey,
              child: ListView(
                children: [
                  Padding(
                    padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios)),
                        const Text(back)
                      ],
                    ),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: const Text(signUpWithEmailOrPhoneNumber,style: TextStyle(fontSize:32 ,fontWeight: FontWeight.w500),),
                  ),
                  Padding(
                    padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                    child: TextFieldCustom(white, const SizedBox(),const SizedBox(), firstName, fitrstNameController, TextInputType.name, 1,(v){},(){},false),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: TextFieldCustom(white, const SizedBox(),const SizedBox(), lastName, lastNameController, TextInputType.emailAddress, 1,(v){},(){},false),
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
                      },), youMobailNumber, mobailController, TextInputType.number, 1,(phoneNumber){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('+${country.flagEmoji} $phoneNumber')
                        )
                      );
                    },(){},false),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: TextFieldCustom(white, const SizedBox(),const SizedBox(), username, userNameController, TextInputType.name, 1,(v){},(){},false),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: TextFieldCustom(white, const SizedBox(),const SizedBox(), birthDate, birthDateeController, TextInputType.name, 1,(v){},()async{
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
                    padding:  leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.check_circle_outline,color: darkGreenColor,),
                        ),
                        Text(bySigningUpYouAgreeeToThe,style: TextStyle(fontSize: 12,color: subtitleColor),),
                        Text(' $termsOfSerbvice ',style: TextStyle(fontSize: 12,color: lightGreen),),
                        Text(and,style: TextStyle(fontSize: 12,color: subtitleColor),),
                        Expanded(child: Text(' $privacyPolicy',style: TextStyle(fontSize: 12,color: lightGreen),))
                      ],
                    ),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: ButtonCustom(0,0, screenHight*0.06, const Text(signUp,style: TextStyle(color: white,fontSize: 18),), darkGreenColor, darkGreenColor, (){
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      formKey.currentState!.save();
                      Navigator.pushNamed(context,'/SetPassword',arguments: SetPassword(
                        fitrstName: fitrstNameController.text,
                        lastName: lastNameController.text,
                        mobail: mobailController.text,
                        userName: userNameController.text,
                        birthDate: birthDateController,
                      ),);
                    }),
                  ),
                  Padding(
                    padding: leftAndRightPadding(0.02,0.2),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          SizedBox(width:screenWidth*0.42 ,child:const Divider(color: subtitleColor,thickness: 0.6,)),
                          const Text('      $or     ',style: TextStyle(color: subtitleColor),),
                          const Expanded(child:Divider(color: subtitleColor,thickness: 0.6,)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                    child: ButtonCustom(0,0, screenHight*0.06,  BlocBuilder<AuthBloc,AuthStates>(
                      builder:(context, state) {
                        if(state is InitialState){
                          return const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.google,color: darkRedColor,),
                              Text('   $signUpWithGamil',style: TextStyle(color: black,fontSize: 18),),
                            ],
                          );
                        }else if(state is LoadingState){
                          return const CupertinoActivityIndicator(color: darkGreenColor,);
                        }else if(state is ErrorState){
                          return  Text(state.failure,style: TextStyle(fontSize: 30,color: darkRedColor),);
                        }else if(state is SuccessState){
                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                            Navigator.pushNamed(context, '/MapScreen');
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: 'Your Register Completed Successfully!',
                              confirmBtnColor: darkGreenColor,
                            );
                          });
                          return const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.google,color: darkRedColor,),
                              Text('   $signUpWithGamil',style: TextStyle(color: black,fontSize: 18),),
                            ],
                          );
                        }return SizedBox();
                      },
                    ), white, subtitleColor, (){
                      context.read<AuthBloc>().add(RegisterWithGmailEvent());
                    }),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: ButtonCustom(0,0, screenHight*0.06,const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.facebook,),
                        Text('   $signUpWithFacebook',style: TextStyle(color: black,fontSize: 18),),
                      ],
                    ), white, subtitleColor, (){
                      context.read<AuthBloc>().add(RegisterWithFacebookEvent());
                    }),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(alreadyHaveAnAccount),
                        TextButton(onPressed: (){Navigator.pushNamed(context, '/Login');}, child: const Text('  $signIn',style: TextStyle(color: darkGreenColor),))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}