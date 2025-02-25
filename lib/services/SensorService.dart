import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:erwini/config.dart';
import 'package:erwini/services/authservice.dart';

class SensorService {
  static const refreshInterval = Duration(seconds: 2); // Refresh every hour
  late Timer _timer;
  List<dynamic> sensorData = [];
  StreamController<List<dynamic>> _dataController = StreamController();
  Stream<List<dynamic>> get onData => _dataController.stream;


  Future<List<dynamic>> getCapteurData() async {
    if (sensorData.isEmpty) {
      await refreshData();
    }
    return sensorData;
  }


  Future<void> refreshData() async {
    final  authservice Authservice = authservice();
    final token = await Authservice.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await http.get(Uri.parse(config.urlsensors), headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

        sensorData = jsonData;
      _dataController.add(sensorData);

    } else {
      throw Exception('Failed to load data');
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
