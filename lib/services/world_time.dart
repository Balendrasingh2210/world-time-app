import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the ui
  late String time; //the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for the end point
  late bool isDaytime; //to check if daytime is true or false

  WorldTime({required this.location, required this.flag, required this.url});

  getTime() async {
    try {
      //make the request

      //uri.parse is used to remove the error for "the argument string can't be assigned to the data type uri"
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      //get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);
      // create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      // set the time property
      time = DateFormat.jm().format(
          now); //DateFormat a widget imported from package intl it formats the format of time
    } catch (e) {
      // print("error caught : $e");
      time = "could not get time data";
    }
  }
}
