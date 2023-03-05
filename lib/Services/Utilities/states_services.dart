import 'dart:convert';

import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:http/http.dart' as http;
import 'app_url.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecord() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception();
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception();
    }
  }
}
