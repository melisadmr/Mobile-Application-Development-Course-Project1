import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<String>> fetchCountries() async {
    final response = await http.get(Uri.parse('$baseUrl/list.php?a=list'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['meals'] as List).map((meal) => meal['strArea'] as String).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<String> fetchCountryFlag(String country) async {
    final response = await http.get(Uri.parse('$baseUrl/filter.php?a=$country'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['meals'][0]['strMealThumb'] as String;
    } else {
      throw Exception('Failed to load country flag');
    }
  }
}
