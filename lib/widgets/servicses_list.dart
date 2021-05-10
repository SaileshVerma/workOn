import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_on/providers/services.dart';
import 'package:work_on/widgets/serviceCard.dart';

class ServiceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final serviceList = Provider.of<Services>(context).data;

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: serviceList.length,
        itemBuilder: (ctx, i) => ServiceCard(
              id: serviceList[i].id,
              name: serviceList[i].name,
              fees: serviceList[i].fees,
              imgurl: serviceList[i].imgurl,
              lat: serviceList[i].lat,
              long: serviceList[i].long,
              phn: serviceList[i].phn,
              skill: serviceList[i].skill,
            ));
  }
}
