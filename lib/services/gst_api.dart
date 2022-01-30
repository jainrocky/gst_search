import 'dart:convert';
import 'dart:io';
import 'package:gst_search/models/gst_profile.dart';
import 'package:http/http.dart' as http;


class GSTApi{

  static const String BASE_URL="https://raw.githubusercontent.com/jainrocky/gst_search/main/api/v1/";

  static Future<GSTProfile> getGSTProfileByGSTNumber(String gstNumber) async{
    try{
      var response = await http.get(Uri.parse(BASE_URL + gstNumber + ".json"));

      if(response.statusCode == HttpStatus.ok){
        Map map=jsonDecode(response.body);
        return GSTProfile.fromJson(map);
      }

    }catch(e){
      //for debugging only
      print("ERROR: "+e.toString());

    }
    return null;
  }

}