import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/country_provider.dart';

class CountryDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedCountry = Provider.of<CountryProvider>(context).selectedCountry;
    final countryFlag = Provider.of<CountryProvider>(context).countryFlag;

    return Scaffold(
      appBar: AppBar(title: Text(selectedCountry ?? 'Country Detail')),
      body: selectedCountry == null || countryFlag == null
          ? Center(child: Text('No country selected!'))
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  selectedCountry,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Hero(
                  tag: 'country-flag',
                  child: Image.network(countryFlag),
                ),
              ],
            ),
    );
  }
}
