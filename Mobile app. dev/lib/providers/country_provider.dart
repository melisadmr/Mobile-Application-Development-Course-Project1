import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CountryProvider with ChangeNotifier {
  List<String> _countries = [];
  String? _selectedCountry;
  String? _countryFlag;

  List<String> get countries => _countries;
  String? get selectedCountry => _selectedCountry;
  String? get countryFlag => _countryFlag;

  final ApiService _apiService = ApiService();

  Future<void> fetchCountries() async {
    _countries = await _apiService.fetchCountries();
    notifyListeners();
  }

  Future<void> selectCountry(String country) async {
    _selectedCountry = country;
    _countryFlag = await _apiService.fetchCountryFlag(country);
    notifyListeners();
  }
}
