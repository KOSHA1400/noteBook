import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:notebook/widget/MyButton.dart';
import 'package:notebook/utils/network.dart';
import 'package:notebook/widget/MyTextField.dart';
 class AddEditScreen extends StatefulWidget {
   static TextEditingController nameController=TextEditingController();
    static TextEditingController phoneController=TextEditingController();
    static int id=0;
  const AddEditScreen({ Key? key }) : super(key: key);

  @override
  _AddEditScreenState createState() =>_AddEditScreenState();
}


class _AddEditScreenState extends State<AddEditScreen> {
final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
    
          elevation: 0,
          backgroundColor: Colors.redAccent,
          title: Text(
            AddEditScreen.id==0 ?'مخاطب جدید':'ویرایش کردن', style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
    
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          
          child: Column(
            children: [
              MyTextField(
                controller: AddEditScreen.nameController,
                 errorText: "لطفا نام را واردکنید",
                  inputType:TextInputType.name , 
                  hintText: 'نام'),
               
                  MyTextField(
                controller: AddEditScreen.phoneController,
                 errorText: "لطفا شماره را واردکنید",
                  inputType:TextInputType.phone, 
                  hintText: 'شماره'),
                  const SizedBox(height:20 ,),
                MyButton(child: Text(AddEditScreen.id==0?'اضافه کردن':'ویرایش کردن'), width: 6, onPressed:(){
                  if(formKey.currentState!.validate()){
NetWork.deleteContact('2',);

          if(AddEditScreen.id==0){
            NetWork.postData(phone:AddEditScreen.phoneController.text,fullname:AddEditScreen.nameController.text );
          }else{
          NetWork.putData(phone:AddEditScreen.phoneController.text,fullname:AddEditScreen.nameController.text, id:AddEditScreen.id.toString());
          }
NetWork.postData(phone:AddEditScreen.phoneController.text,fullname:AddEditScreen.nameController.text );
Navigator.pop(context);
                  }
                },
                )
            ],
            
            ),
        ),
        ),
    );
  }
}