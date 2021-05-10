import 'package:flutter/cupertino.dart';

class Service {
  String id;
  String name;
  String phn;
  String skill;
  String fees;
  double lat;
  double long;
  String imgurl;

  Service(
      {@required this.id,
      @required this.name,
      @required this.phn,
      @required this.fees,
      @required this.skill,
      @required this.imgurl,
      @required this.lat,
      @required this.long});
}
