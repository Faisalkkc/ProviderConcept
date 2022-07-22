import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nsdd/models/provinces.dart';
import '../networks/api_service.dart';
import '../networks/network_client.dart';

class ProvinceProvider with ChangeNotifier {
  ApiService apiService =
      ApiService(networkClient: NetworkClient('http://10.5.6.55:8000/'));
  // List<Country> countries = [];
  List<DropdownMenuItem<Provinces>> _provinces = [];

  get provinces {
    return _provinces;
  }

  Future<void> getProvincesFromAPI() async {
    final res = await apiService.getProvincesFromAPI();
    Map<String, dynamic> mp = jsonDecode(res.toString());

    _provinces = (mp['data'] as List).map((e) {
      Provinces province = Provinces.fromJson(e);
      return DropdownMenuItem<Provinces>(
        value: province,
        child: Text(province.name),
      );
    }).toList();
    notifyListeners();
  }
}
