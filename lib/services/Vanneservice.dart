import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:erwini/config.dart';
import 'package:erwini/services/authservice.dart';

class VanneService {
  static const refreshInterval = Duration(seconds: 2); // Refresh every hour
  late Timer _timer;
  List<dynamic> vanneData = [];
  StreamController<List<dynamic>> _dataController = StreamController();
  Stream<List<dynamic>> get onData => _dataController.stream;

  Future<List<dynamic>> getvanneData() async {
    if (vanneData.isEmpty) {
      await refreshData();
    }
    return vanneData;


  }
  Future<void> refreshData() async {
    final  authservice Authservice = authservice();
    final token = await Authservice.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await http.get(Uri.parse(config.urlvannes), headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      print("hello");
      vanneData = jsonData;
      _dataController.add(vanneData);
      print(vanneData);

    } else {
      throw Exception('Failed to load data');
    }
  }
  Future<void> updatestate(switchValue, id) async {
    print("texte");
    print(switchValue);
    print(id);
    final authservice Authservice = authservice();
    final token = await Authservice.getToken();
    if (token == null) {
      throw Exception('No token found');
    }

    final response = await http.put(Uri.parse(config.urlvannestate), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    }, body: jsonEncode({
      'Etat': switchValue,
      'id':id
    }));
    if (response.statusCode == 200) {
      print("vanne state updated successfully.");
    } else {
      throw Exception('Failed to update well state');
    }
  }






  void startRefreshTimer() {
    _timer = Timer.periodic(refreshInterval, (timer) async {
      await refreshData();
    });
  }

  void stopRefreshTimer() {
    _timer.cancel();
  }

  void dispose() {
    _dataController.close();
  }
}
