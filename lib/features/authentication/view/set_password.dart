import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
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


class SetPassword extends StatelessWidget {
  String fitrstName;
  String lastName;
  String userName;
  String mobail;
  DateTime birthDate;
  GlobalKey<FormState> formKeyT = GlobalKey();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  ValueNotifier<bool> valueNotifierPass = ValueNotifier(true);
  ValueNotifier<bool> valueNotifierConfirmPass = ValueNotifier(true);
  SetPassword({required  this.fitrstName,required this.lastName,required this.mobail,required this.userName,required this.birthDate});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: white,
            body: Form(
              key: formKeyT,
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
                    padding: leftAndRightAndTopPadding(0.02,0.02,0.02),
                    child: Center(child: const Text(setPassword,style: TextStyle(fontSize:32 ,fontWeight: FontWeight.w500),)),
                  ),
                  Padding(
                    padding: leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(child: const Text(setYourPassword,style: TextStyle(fontSize:18 ,color: subtitleColor),)),
                    ),
                  ),
                  Padding(
                    padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                    child: ValueListenableBuilder(
                        valueListenable: valueNotifierPass,
                        builder: (context, value, child){
                        return TextFieldCustom(white, IconButton(onPressed: (){valueNotifierPass.value=!valueNotifierPass.value;}, icon: (value==true)?Icon(Icons.visibility_off_outlined,color: subtitleColor,):Icon(Icons.visibility,color: darkGreenColor,)) ,const SizedBox(), enteerYourPassword, passwordController, TextInputType.name, 1,(v){},(){},valueNotifierPass.value);
                      }
                    ),
                  ),
                  Padding(
                    padding:  leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: ValueListenableBuilder(
                        valueListenable: valueNotifierConfirmPass,
                        builder: (context, value, child){
                          return TextFieldCustom(white, IconButton(onPressed: (){valueNotifierConfirmPass.value=!valueNotifierConfirmPass.value;}, icon: (value==true)?Icon(Icons.visibility_off_outlined,color:subtitleColor ,):Icon(Icons.visibility,color: darkGreenColor,)) ,const SizedBox(), confirmPassword, confirmPasswordController,  TextInputType.name, 1,(v){},(){},valueNotifierConfirmPass.value);
                        }
                    ),
                  ),
                  Padding(
                    padding:  leftAndRightAndTBottomPadding(0.02,0.02,0.02),
                    child: Text(atLeast1NumberOrAspecialCharacter,style: TextStyle(fontSize: 12,color: subtitleColor),),
                  ),
                  Padding(
                    padding: leftAndRightAndTopPadding(0.02,0.02,0.04),
                    child: ButtonCustom(0,0, screenHight*0.06, BlocBuilder<AuthBloc,AuthStates>(
                      builder:(context, state) {
                        if(state is InitialState){
                          return const Text(signUp,style: TextStyle(fontSize: 30,color: white),);
                        }else if(state is LoadingState){
                          return const CupertinoActivityIndicator(color: white,);
                        }else if(state is ErrorStatee){
                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              text: state.failure,
                                confirmBtnColor: darkRedColor ,
                              // autoCloseDuration: Duration(seconds: 30),

                            );
                          });
                          return const Text(signUp,style: TextStyle(fontSize: 30,color: white),);
                        }else if(state is SuccessStatee){
                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                            Navigator.pushNamed(context, '/Login');
                          });
                          return const Text(signUp,style: TextStyle(fontSize: 30,color: white),);
                        }return SizedBox();
                      },
                    ), darkGreenColor, darkGreenColor, (){
                      if (!formKeyT.currentState!.validate()) {
                        return;
                      }
                      formKeyT.currentState!.save();
                      UserModel userModel=UserModel(firstName: fitrstName,lastName: lastName,phone: mobail,username: userName,birthDate: birthDate,password: passwordController.text,confirmPassword: confirmPasswordController.text);
                      context.read<AuthBloc>().add(RegisterEvent(userModel));
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
