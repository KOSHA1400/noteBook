import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notebook/screens/add_edit_screen.dart';
import 'package:notebook/utils/network.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() =>_HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
@override
  void initState() {
   
NetWork.getData().then((value)async{
await Future.delayed(const Duration(seconds:3));
setState(() {});
  

});
  

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (
          
        ) {AddEditScreen.id=0;
        AddEditScreen.nameController.text='';
        AddEditScreen.phoneController.text='';
          Navigator.push(context,MaterialPageRoute(builder:(context)=>const AddEditScreen(),
          ),
          ).then((value) => {
            NetWork.getData().then((value)async{
await Future.delayed(const Duration(seconds:3));
setState(() {});
          }),

        });
        },
      
          child: Icon(Icons.add),
          backgroundColor: Colors.redAccent,
          elevation: 0,
        ),
        appBar: AppBar(

          elevation: 0,
          backgroundColor: Colors.redAccent,
          title: const Text(
            "دفترچه تلفن آنلاین", style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
          leading: const Icon(Icons.import_contacts_sharp),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh),)
          ],
        ),
        body:ListView.builder(
        itemCount:NetWork.contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
onLongPress: ()async{
  NetWork.deleteContact(NetWork.contacts[index].id.toString());
   await Future.delayed(Duration(seconds: 5));
},

            leading:CircleAvatar(backgroundColor: Colors.redAccent,
              child:Text((index+1).toString(),style: TextStyle(color:Colors.white ),) ,
            ) ,
            trailing:IconButton(
              onPressed: (){
               AddEditScreen.id=NetWork.contacts[index].id;
        AddEditScreen.nameController.text=NetWork.contacts[index].fullname;
             AddEditScreen.phoneController.text=NetWork.contacts[index].phone;
          Navigator.push(context,MaterialPageRoute(builder:(context)=>const AddEditScreen(),
          ),
          ).then((value)async {
            NetWork.getData().then((value)async{
await Future.delayed(const Duration(seconds:3));
setState(() {});
          });
          });
              },
             
              icon:Icon(Icons.edit) ,) ,
            title:Text(NetWork.contacts[index].fullname),
            subtitle: Text(NetWork.contacts[index].phone),
          );
        },
        ),
    );


        }}
