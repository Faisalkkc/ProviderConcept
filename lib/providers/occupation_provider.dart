import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nsdd/models/occupation.dart';
import '../networks/api_service.dart';
import '../networks/network_client.dart';

class OccupationProvider with ChangeNotifier {
  ApiService apiService =
      ApiService(networkClient: NetworkClient('http://10.5.6.55:8000/'));
  // List<Country> countries = [];
  List<DropdownMenuItem<Occupation>> _occupations = [];

  get occupations {
    return _occupations;
  }

  Future<void> getOccupationFromAPI() async {
    final res = await apiService.getOccupationFromAPI();
    Map<String, dynamic> mp = jsonDecode(res.toString());

    _occupations = (mp['data'] as List).map((e) {
      Occupation occupation = Occupation.fromJson(e);
      return DropdownMenuItem<Occupation>(
        value: occupation,
        child: Text(occupation.name),
      );
    }).toList();
    notifyListeners();
  }
}
