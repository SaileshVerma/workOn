import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_on/providers/services.dart';
import 'package:work_on/widgets/serviceCard.dart';

class RequestedServiceScreen extends StatelessWidget {
  static const routname = '/requestedServiceScreen';

  @override
  Widget build(BuildContext context) {
    final sprovider = Provider.of<Services>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Text(
              "WORK",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "ON",
              style: TextStyle(
                  color: Color.fromRGBO(224, 153, 47, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(
          color: Colors.black,
          child: ListView(
            children: sprovider.searchList
                .map(
                  (i) => ServiceCard(
                    fees: i.fees,
                    id: i.id,
                    imgurl: i.imgurl,
                    lat: i.lat,
                    long: i.long,
                    name: i.name,
                    phn: i.phn,
                    skill: i.skill,
                  ),
                )
                .toList(),
          )
          //  ListView.builder(
          //   itemCount: sprovider.searchList.length,
          //   itemBuilder: (ctx, i) => ServiceCard(
          //     fees: sprovider.searchList[i].fees,
          //     id: sprovider.searchList[i].id,
          //     imgurl: sprovider.searchList[i].imgurl,
          //     lat: sprovider.searchList[i].lat,
          //     long: sprovider.searchList[i].long,
          //     name: sprovider.searchList[i].name,
          //     phn: sprovider.searchList[i].phn,
          //     skill: sprovider.searchList[i].skill,
          //   ),
          // )

          ),
    );
  }
}
