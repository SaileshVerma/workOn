import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ServiceCard extends StatelessWidget {
  final String id;
  final String name;
  final String phn;
  final String skill;
  final String fees;
  double lat;
  double long;
  String imgurl;
  ServiceCard(
      {this.id,
      this.name,
      this.fees,
      this.imgurl,
      this.lat,
      this.long,
      this.phn,
      this.skill});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(53, 52, 50, 1),
          borderRadius: BorderRadius.circular(12),
        ),
        height: 160,
        child: Column(
          children: [
            Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 20),
                  child: Container(
                    height: 85,
                    width: 93,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          image: NetworkImage(imgurl), fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Color.fromRGBO(224, 153, 47, 1), fontSize: 20),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Rs." + fees.toString() + "/hr",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      skill,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 200),
              child: Row(
                children: [
                  Icon(Icons.call_outlined,
                      size: 30, color: Color.fromRGBO(224, 153, 47, 1)),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.location_on_outlined,
                      size: 30, color: Color.fromRGBO(224, 153, 47, 1)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
