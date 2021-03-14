import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
class WorldTime{
  String location;
  String time='test';
  String date;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime()async{
    int status;
    Response response;
    try {
      var url = Uri.https('worldtimeapi.org', '/api/timezone/${this.url}');
      int i=0;
      do {
        i++;
        response = await get(url);
        status = response.statusCode;
        print(status);
      } while (status != 200&&i<=5);

      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      String hour_offset = offset.substring(1, 3);
      String min_offset = offset.substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(hour_offset),
          minutes: int.parse(min_offset)
      ));
      isDaytime=now.hour>6&&now.hour<19?true:false;

      date=now.toString().substring(0,10);

      time=DateFormat.jm().format(now);
    }catch(e){
      time=e.toString();
      print('Error while Getting the Data $e');
    }
  }
}
