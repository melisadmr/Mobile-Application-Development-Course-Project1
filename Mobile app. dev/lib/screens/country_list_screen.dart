import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/country_provider.dart';
import 'country_detail_screen.dart';

class CountryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countries')),
      body: FutureBuilder(
        future: Provider.of<CountryProvider>(context, listen: false).fetchCountries(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('An error occurred!'));
          } else {
            return Consumer<CountryProvider>(
              builder: (ctx, countryProvider, _) => ListView.builder(
                itemCount: countryProvider.countries.length,
                itemBuilder: (ctx, i) {
                  final country = countryProvider.countries[i];
                  return ListTile(
                    title: Text(country),
                    onTap: () {
                      countryProvider.selectCountry(country);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => CountryDetailScreen()),
                      );
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
