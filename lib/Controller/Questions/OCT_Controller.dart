import 'dart:io';
import 'package:checkupapp/Core/Class/statusrequest.dart';
import 'package:checkupapp/Core/Function/handlingdatacontroller.dart';
import 'package:checkupapp/Core/Services/SharedPre.dart';
import 'package:checkupapp/Data/DataSource/Remote/Questions/OCT_Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

abstract class OCT_Controller extends GetxController {
  PostDataOCT();
  getImageGallary();

}

class OctControllerImp extends OCT_Controller {

 late String filename;
 late Image image;
  StatusRequest? statusRequest;
  OctData octData=OctData(Get.find());
 File? file;
 List data = [];
 @override
  getImageGallary()async{
   final ImagePicker picker = ImagePicker();
   final PickedFile? imageGallary = await picker.getImage(source: ImageSource.gallery);
   file =File(imageGallary!.path);

   update();
 }

  @override
  PostDataOCT() async{
   String t=SharedPrefrenceHelper.getData(key: 't');
    var headers = {
      'Accept': 'application/json',
    'Authorization': t,
    };
    var request =http.MultipartRequest('POST', Uri.parse('https://checkup.azad.digital/api/oct-submit'));
    request.fields.addAll({
      'filename': '1.jpg'
    });

    request.files.add(await http.MultipartFile.fromPath('image','${file!.path}'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
   print(file!.path);
    if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    print("=========================A7A");
    }
    else {
    print(response.reasonPhrase);
    }

  }


  // PostDataOCT() async{
  //
  //     statusRequest = StatusRequest.loading;
  //     var response = await octData.postOctData('1.jpg',file!);
  //     statusRequest = handlingData(response);
  //     if (StatusRequest.success == statusRequest) {
  //       print("=============================== Controller $response ");
  //     }
  //     else {
  //       Get.defaultDialog(title: "Warning", middleText: "Can't be Empty");
  //       statusRequest = StatusRequest.failure ;
  //     }
  //     update();
  // }


  @override
  void onInit() {
    super.onInit();
  }

}





































// Future<dynamic> uploadImage(
//     Uint8List bytes,
//     String fileName
//     ) async {
//   Uri url = Uri.parse("https://checkup.azad.digital/api/oct-submit");
//   var request = http.MultipartRequest("POST", url);
//   var myFile = http.MultipartFile(
//     "file",
//     http.ByteStream.fromBytes(bytes),
//     bytes.length,
//     filename: fileName,
//   );
//   request.files.add(myFile);
//   final respones = await request.send();
//   if (respones.statusCode == 201) {
//     var data = await respones.stream.bytesToString();
//     return jsonDecode(data);
//   } else {
//     return null;
//   }
// }