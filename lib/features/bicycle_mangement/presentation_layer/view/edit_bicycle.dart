import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../config/responsive.dart';
import '../../../../core/resources/color.dart';
import '../../../../core/resources/padding.dart';
import '../../../../core/resources/string.dart';
import '../../../../core/resources/variable.dart';
import '../../../../core/widgets_App/buttons_widget.dart';
import '../../../../core/widgets_App/textField_widget.dart';
import '../../../../injection_container.dart';
import '../../domain_layer/entities/bicycle_Supa_entity.dart';
import '../bloc/bloc_supa.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';
import '../widget/drop_down.dart';

class EditBicycle extends StatefulWidget {
  int id;
  String model;
  String type;
  String pric;
  String size;
  String photo;
  EditBicycle({required this.id, required this.model,required this.type,required this.pric, required this.size,required this.photo});
  @override
  State<EditBicycle> createState() => _EditBicycleState();
}

class _EditBicycleState extends State<EditBicycle> {
  TextEditingController modelController=TextEditingController();
  TextEditingController typeController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController sizeController=TextEditingController();
  TextEditingController photoController=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  var image;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BicycleSupaBloc>(
        create: (context) => sl(),
        child: Builder(
            builder: (context) {
              return Scaffold(
                backgroundColor: white,
                body: Form(
                  key: formKey,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
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
                          padding: leftAndRightAndTBottomPadding(0.04,0.02,0.02),
                          child: const Text(EditBicyle,style: TextStyle(fontSize:32 ,fontWeight: FontWeight.w500),),
                        ),
                        Padding(
                          padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                          child: TextFieldCustom(white, const SizedBox(),const SizedBox(), widget.model, modelController, TextInputType.name, 1,(v){},(){},false),
                        ),
                        Padding(
                          padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                          child: TextFieldCustom(white, const SizedBox(),const SizedBox(),  widget.pric, priceController, TextInputType.number, 1,(v){},(){},false),
                        ),
                        Padding(
                          padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                          child: TextFieldCustom(white, const SizedBox(),const SizedBox(),  widget.size, sizeController, TextInputType.number, 1,(v){},(){},false),
                        ),
                        Padding(
                          padding:  leftAndRightAndTopAndTBottomPadding(0.02,0.02,0.018,0.018),
                          child: DropDown('       ${ widget.type}',typeController,TypeItems),
                        ),
                        Padding(
                          padding: leftAndRightPadding(0.02, 0.02),
                          child: Center(child:  widget.photo != null?Column(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: Image.network(widget.photo,fit: BoxFit.cover,)
                              ),
                              IconButton(
                                onPressed: () {uploadImage();},
                                icon: Icon(Icons.add_a_photo, color: Colors.grey,),
                              ),
                            ],
                          ):IconButton(onPressed: () {uploadImage();},
                            icon: Icon(Icons.add_a_photo, color: Colors.grey,),
                          ),),
                        ),
                        Align(
                          alignment:Alignment.bottomCenter,
                          child: Padding(
                            padding: leftAndRightAndTopAndTBottomPadding(0.0,0.0,0.04, 0.02),
                            child: ButtonCustom(0,screenWidth*0.3, screenHight*0.06, BlocBuilder<BicycleSupaBloc,BicycleStates>(
                              builder:(context, state) {
                                if(state is InitialState){
                                  return const Text(edit,style: TextStyle(fontSize: 30,color: white),);
                                }else if(state is ErrorState){
                                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.error,
                                      text: state.failure,
                                      confirmBtnColor: darkRedColor ,
                                      // autoCloseDuration: Duration(seconds: 30),
                                    );
                                  });
                                  return const Text(edit,style: TextStyle(fontSize: 30,color: white),);
                                }else if(state is SuccessState){
                                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                    Navigator.pushNamedAndRemoveUntil(context, '/ButtomNavBar',(route)=>false);
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.success,
                                      text: 'Your Added Completed Successfully!',
                                      confirmBtnColor: darkGreenColor,

                                    );
                                  });
                                  return const Text(edit,style: TextStyle(fontSize: 30,color: white),);
                                }return Center(child: CupertinoActivityIndicator(color: lightGreen,));
                              },
                            ), darkGreenColor, darkGreenColor, (){
                              // if (!formKey.currentState!.validate()) {
                              //   return;
                              // }
                              formKey.currentState!.save();
                              if(modelController.text==''||modelController.text==null){
                                modelController.text=widget.model;
                              }
                              if(priceController.text==''||priceController.text==null){
                                priceController.text=widget.pric;
                              }
                              if(sizeController.text==''||sizeController.text==null){
                                sizeController.text=widget.size;
                              }
                              if(typeController.text==''||typeController.text==null){
                                typeController.text=widget.type;
                              }
                              if(photoController.text==''||photoController.text==null){
                                photoController.text=widget.photo;
                              }
                              BicycleSupaEntity bicycleSupaEntity=BicycleSupaEntity(modelName: modelController.text,price: double.parse(priceController.text),size: int.parse(sizeController.text),note: 'no thing',type: typeController.text,photoPath: photoController.text);
                              context.read<BicycleSupaBloc>().add(EditBicycleSupa(widget.id,bicycleSupaEntity));
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        )
    );
  }
  final supabase=Supabase.instance.client;
  void uploadImage()async{
    final ImagePicker picker = ImagePicker();
    var imagePick = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image=File(imagePick!.path);
    });print(supabase.storage.from('images').bucketId);
    List name=image.path.split('/');
    await supabase.storage.from('images').upload('upload/${name.last}', image);
    final a=await supabase.storage.from('images').getPublicUrl('upload/${name.last}');
    photoController.text =a.toString();
    print(a);
    setState(() {
      widget.photo=a;
    });
    // pathUpload.add('upload/${name.last}');
  }
}
