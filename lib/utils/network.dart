import 'package:http/http.dart' as http;
import 'package:notebook/models/contact.dart';
import 'dart:convert'as convert;
class NetWork{
  static Uri url=Uri.parse('https://retoolapi.dev/doNhKr/contacts');
  static Uri urlWithId(String id){
Uri url=Uri.parse('https://retoolapi.dev/doNhKr/contacts/$id');
return url;
  }
static List<Contact>contacts=[];
//get data
static getData()async{

  http.get(NetWork.url).then((response) 
  {if(response.statusCode==200){
    List jsonDeCode=convert.jsonDecode(response.body);
    jsonDeCode.forEach((element) {
      NetWork.contacts.add(Contact.fromJson(element));
     });
    print(jsonDeCode);
  }}
  );
}

//post data
 static  postData( {
   required String phone,
   required String fullname,
 } )async{
   Contact cantact =new Contact(phone: phone, fullname: fullname);
   http.post(NetWork.url,body: cantact.toJson()).then((response) {
print(response.body);

   });
 }
 //put data
  static  putData( {
   required String phone,
   required String fullname,
   required String id,
 } )async{
   Contact cantact =new Contact(phone: phone, fullname: fullname);
   http.put(NetWork.urlWithId(id),body: cantact.toJson()).then((response) {
print(response.body);

   });
 }

static void deleteContact(String id)async{
http.delete(NetWork.urlWithId(id)).then((value){});
getData();
}




 }
