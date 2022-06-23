import 'package:firebase_database/firebase_database.dart';


class Data{
  String  callsign;
  String eobt;
  String priority;
  String runway;
  String stand;
  String time;
  String tsat;

  Data(this.callsign,this.eobt,this.priority,this.runway,this.stand,this.time,this.tsat);
  
}