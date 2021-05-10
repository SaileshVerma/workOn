import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:work_on/providers/service_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Services with ChangeNotifier {
  List<Service> _data = [
    Service(
        id: '1',
        name: "Sailesh Verma",
        phn: "9090909090",
        fees: '200',
        skill: "Coder",
        imgurl:
            "https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?size=626&ext=jpg",
        lat: 74.21793260000001,
        long: 27.023803599999997),
    Service(
        id: '2',
        name: "Sailesh Verma",
        phn: "9090909090",
        fees: '200',
        skill: "Coder",
        imgurl:
            "https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?size=626&ext=jpg",
        lat: 74.21793260000001,
        long: 27.023803599999997),
    Service(
        id: '3',
        name: "Sailesh Verma",
        phn: "9090909090",
        fees: '200',
        skill: "Coder",
        imgurl:
            "https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?size=626&ext=jpg",
        lat: 74.21793260000001,
        long: 27.023803599999997),
    Service(
        id: '4',
        name: "Sailesh Verma",
        phn: "9090909090",
        fees: '200',
        skill: "Coder",
        imgurl:
            "https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?size=626&ext=jpg",
        lat: 74.21793260000001,
        long: 27.023803599999997),
  ];

  List<Service> get data {
    return _data;
  }

  List<Service> searchList = [];
  Future<void> addRequestService(Service service) async {
    final url = "https://job-api-hacks.herokuapp.com/addJobs";

    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.post(url,
        headers: headers,
        body: json.encode({
          'name': service.name,
          'fees': double.parse(service.fees),
          'services': service.skill,
          'phoneNumber': service.phn,
          'latitude': service.lat,
          'longitude': service.long,
          'imageUrl': service.imgurl,
          'tags': [],
        }));

    print(response.body);
  }

  var selectedDistance = 100;

  void selectedDistancefunc(int distance) {
    selectedDistance = distance;
    print("this distance was choosen by the user =" +
        selectedDistance.toString());
    notifyListeners();
  }

  Future<void> searchService(String search) async {
    searchList = [];
    final url = "https://job-api-hacks.herokuapp.com/getJobs";

    Map<String, String> headers = {"Content-type": "application/json"};
    print(search);
    print(selectedDistance);
    final response = await http.post(url,
        headers: headers,
        body: json.encode({
          "maxDist": selectedDistance,
          "searchTerm": search,
        }));

    var requestedData = json.decode(response.body) as List<dynamic>;
    print(requestedData);

    print(requestedData[0]['location']['latitude']);
    if (requestedData == null) return;

    for (int i = 0; i < requestedData.length; i++) {
      searchList.add(Service(
        id: requestedData[i]['_id'].toString(),
        fees: requestedData[i]['fees'].toString(),
        phn: requestedData[i]["phoneNumber"].toString(),
        imgurl: requestedData[i]["imageUrl"].toString(),
        lat: double.parse(requestedData[i]['location']['latitude'].toString()),
        long:
            double.parse(requestedData[i]['location']['longitude'].toString()),
        name: requestedData[i]['name'].toString(),
        skill: requestedData[i]['services'].toString(),
      ));
    }

    notifyListeners();
    print(searchList);
  }
}
