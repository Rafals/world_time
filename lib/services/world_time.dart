import 'package:http/http.dart';
import 'dart:convert';
//import 'package:intl/intl.dart';

class WorldTime {

  String location = ''; // location name for the UI
  String time = ''; // the time in that location
  String flag = ''; //url to an asset flag icon
  String url = ''; // location url for api endpoint
  late bool isDaytime; //true or false if daytime or not

  WorldTime({ required this.location, required this.flag, required this.url });

  Future<void> getTime() async {

    try {
      //make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      //String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      //create DateTime object
      time = datetime.substring(11,16);
      String time1 = datetime.substring(11,13);
      DateTime now = DateTime.parse(datetime);
      //now.add(Duration(hours: int.parse(offset)));

      //set the time property

      print(now.hour);
      int time2 = int.parse(time1);
      isDaytime = time2 > 6 && time2 < 20 ? true : false;

    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

  }
}


