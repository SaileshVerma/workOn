import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:work_on/providers/services.dart';

class DistanceChip extends StatefulWidget {
  @override
  _DistanceChipState createState() => _DistanceChipState();
}

class _DistanceChipState extends State<DistanceChip> {
  bool isSelected1 = false;
  bool isSelected2 = false;

  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;

  @override
  Widget build(BuildContext context) {
    final sprovider = Provider.of<Services>(context);
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: ChoiceChip(
              label: Text("100m"),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              avatarBorder: Border.all(color: Colors.white),
              selected: isSelected1,
              selectedColor: Color.fromRGBO(224, 153, 47, 1),
              backgroundColor: Colors.black54,
              onSelected: (val) {
                if (val == true) {
                  sprovider.selectedDistancefunc(100);
                }
                setState(() {
                  isSelected2 = false;
                  isSelected5 = false;
                  isSelected3 = false;
                  isSelected4 = false;
                  isSelected1 = !isSelected1;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: ChoiceChip(
              label: Text("200m"),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              avatarBorder: Border.all(color: Colors.white),
              selected: isSelected2,
              selectedColor: Color.fromRGBO(224, 153, 47, 1),
              backgroundColor: Colors.black54,
              onSelected: (val) {
                if (val == true) {
                  sprovider.selectedDistancefunc(200);
                }
                setState(() {
                  isSelected5 = false;
                  isSelected1 = false;
                  isSelected4 = false;
                  isSelected3 = false;
                  isSelected2 = !isSelected2;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: ChoiceChip(
              label: Text("500m"),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              avatarBorder: Border.all(color: Colors.white),
              selected: isSelected3,
              selectedColor: Color.fromRGBO(224, 153, 47, 1),
              backgroundColor: Colors.black54,
              onSelected: (val) {
                if (val == true) {
                  sprovider.selectedDistancefunc(500);
                }
                setState(() {
                  isSelected2 = false;
                  isSelected5 = false;
                  isSelected1 = false;
                  isSelected4 = false;
                  isSelected3 = !isSelected3;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: ChoiceChip(
              label: Text("1000m"),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              avatarBorder: Border.all(color: Colors.white),
              selected: isSelected4,
              selectedColor: Color.fromRGBO(224, 153, 47, 1),
              backgroundColor: Colors.black54,
              onSelected: (val) {
                if (val == true) {
                  sprovider.selectedDistancefunc(1000);
                }
                setState(() {
                  isSelected3 = false;
                  isSelected2 = false;
                  isSelected5 = false;
                  isSelected1 = false;
                  isSelected4 = !isSelected4;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: ChoiceChip(
              label: Text("Beyond 5 KM"),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              avatarBorder: Border.all(color: Colors.white),
              selected: isSelected5,
              selectedColor: Color.fromRGBO(224, 153, 47, 1),
              backgroundColor: Colors.black54,
              onSelected: (val) {
                if (val == true) {
                  sprovider.selectedDistancefunc(5000);
                }
                setState(() {
                  isSelected3 = false;
                  isSelected2 = false;

                  isSelected1 = false;
                  isSelected4 = false;
                  isSelected5 = !isSelected5;
                });
              }),
        ),
      ],
    );
  }
}
