import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/variable.dart';
import '../../../../core/widgets_App/buttons_widget.dart';
import '../../../../core/widgets_App/textField_widget.dart';
import '../../../../injection_container.dart';
import '../../domain_layer/entities/user_login_entity.dart';
import '../bloc/bloc.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  Country country=CountryParser.parseCountryCode('SY');
  ValueNotifier<bool> valueNotifierPass = ValueNotifier(true);
  ValueNotifier<bool> valueNotifier = ValueNotifier(false);


  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => sl(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: white,
            body: Form(
              key: formKey,
              child: ListView(
                children: [
                  Padding(
                    padding:leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios)),
                        const Text(back)
                      ],
                    ),
                  ),
                  Padding(
                    padding: leftAndRightAndTopPadding(0.02,0.02,0.02),
                    child: Center(child: const Text(signIn,style: TextStyle(fontSize:32 ,fontWeight: FontWeight.w500),)),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(child: const Text(enterYourPhoneAndPassword,style: TextStyle(fontSize:18 ,color: subtitleColor),)),
                    ),
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
                    },), youMobailNumber, phoneController, TextInputType.number, 1,(phoneNumber){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('+${country.flagEmoji} $phoneNumber')
                          )
                      );
                    },(){},false),
                  ),
                  Padding(
                    padding: leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                    child: ValueListenableBuilder(
                        valueListenable: valueNotifierPass,
                        builder: (context, value, child){
                          return TextFieldCustom(white, IconButton(onPressed: (){valueNotifierPass.value=!valueNotifierPass.value;}, icon: (value==true)?Icon(Icons.visibility_off_outlined,color: subtitleColor,):Icon(Icons.visibility,color: darkGreenColor,)) ,const SizedBox(), enteerYourPassword, passwordController, TextInputType.name, 1,(v){},(){},valueNotifierPass.value);
                        }
                    ),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: Row(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: valueNotifier,
                          builder: (context,value,_) {
                            return Checkbox(checkColor:(valueNotifier.value==true)?darkGreenColor:white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              fillColor:  MaterialStateProperty.resolveWith((states) {
                                return white;
                              }),
                              value: valueNotifier.value,
                              onChanged:(value) {
                                valueNotifier.value=!valueNotifier.value;
                                print(valueNotifier.value);
                                if(valueNotifier.value==true){
                                  saveToken=true;
                                }else{
                                  saveToken=false;
                                }
                              }, );
                          },
                        ),
                        Text(rememberMe,style: TextStyle(color: darkGreenColor),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: ButtonCustom(0,0, screenHight*0.06, BlocBuilder<AuthBloc,AuthStates>(
                      builder:(context, state) {
                        if(state is InitialState){
                          return const Text(signIn,style: TextStyle(fontSize: 30,color: white),);
                        }else if(state is LoadingState){
                          return const CupertinoActivityIndicator(color: white,);
                        }else if(state is ErrorStatee){
                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              text: state.failure,
                              confirmBtnColor: darkRedColor ,
                            );
                          });
                          return const Text(signIn,style: TextStyle(fontSize: 30,color: white),);
                        }else if(state is SuccessStatee){
                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                            Navigator.pushNamed(context, '/ButtomNavBar');
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: 'Your Register Completed Successfully!',
                              confirmBtnColor: darkGreenColor,

                            );
                          });
                          return const Text(signUp,style: TextStyle(fontSize: 30,color: white),);
                        }return SizedBox();
                      },
                    ), darkGreenColor, darkGreenColor, (){
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      formKey.currentState!.save();
                      UserLoginEntity userEntity=UserLoginEntity(phone: phoneController.text,password: passwordController.text);
                      context.read<AuthBloc>().add(LoginEvent(userEntity));
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
