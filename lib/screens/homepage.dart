import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_on/providers/services.dart';
import 'package:work_on/widgets/appDrawer.dart';
import 'package:work_on/widgets/distanceChip.dart';
import 'package:work_on/widgets/servicses_list.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var location = "";
  bool _isSelected = false;
  bool _isloading = false;
  @override
  void initState() {
    getuserlocation();
    super.initState();
  }

  void getuserlocation() async {
    final pos = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(pos.latitude);
    print(pos.longitude);
  }

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
      body: _isloading
          ? Container(
              color: Colors.black,
              child: Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
                semanticsLabel: 'Loading',
              )),
            )
          : Container(
              color: Colors.black,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          fillColor: Colors.black,
                          focusColor: Colors.black,
                          hintText: "Search Your Service",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          )),
                      onSubmitted: (val) {
                        sprovider.searchService(val);
                        Navigator.of(context)
                            .pushNamed('/requestedServiceScreen');
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    child: DistanceChip(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 600,
                    color: Colors.black,
                    child: ServiceList(),
                  ),
                ],
              ),
            ),
      drawer: AppDrawer(),
    );
  }
}
