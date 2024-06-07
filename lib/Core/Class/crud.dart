import 'dart:convert';
import 'package:checkupapp/Core/Function/checkInternet.dart';
import 'package:checkupapp/Data/DataSource/Remote/Auth/logout.dart';
import 'package:dartz/dartz.dart';


import 'package:http/http.dart' as http;

import 'statusrequest.dart';

class Crud {
  late logOutData logoutdata;
  var response;
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {

    try {

      if (await checkInternet()) {

        if(data["token"]!=null){

           response = await http.post(Uri.parse(linkurl), body: data,headers: { "Authorization":"${data["token"]}"});

        }else{
           response = await http.post(Uri.parse(linkurl), body: data);
        }

        if (response.statusCode == 200 || response.statusCode == 201) {

          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {

          return const Left(StatusRequest.serverfailure);
        }

      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
  Future<Either<StatusRequest, Map>> getData(String linkurl, Map data) async {

    try {
      if (await checkInternet()) {

        if(data["token"]!=null){
          response = await http.get(Uri.parse(linkurl),headers: {  "Authorization":"${data["token"]}"});
        }else{
          response = await http.get(Uri.parse(linkurl));
        }
        // response = await http.get(Uri.parse(linkurl));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {

          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {

      return const Left(StatusRequest.serverException);
    }
  }
}