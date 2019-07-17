import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'model/exhibitor.dart';
import 'model/performance.dart';

class DataController {

  String _url;
  int _eventId;

  List<Exhibitor> _exhibitors;
  List<Performance> _performances;

  DataController(String url, int eventId) {

    this._url = url;
    this._eventId = eventId;

    this._exhibitors = new List<Exhibitor>();
    this._performances = new List<Performance>();

    loadExhibitors();
    loadPerformances();

  }

  Future<Exhibitor> loadExhibitors() async {
    final response =
        await http.get('http://' + this._url + '/api/event/' + this._eventId.toString() + '/exhibitors');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      final decoded = json.decode(response.body);
      for (var k in decoded) {
        var exhibitor = new Exhibitor(k['id'], k['name'], k['description'], k['url']);
        this._exhibitors.add(exhibitor);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<Performance> loadPerformances() async {
    final response =
        await http.get('http://' + this._url + '/api/event/' + this._eventId.toString() + '/performances');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      final decoded = json.decode(response.body);
      for (var k in decoded) {
        var performance = new Performance(k['id'], k['name'], k['description']);
        this._performances.add(performance);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  List<Exhibitor> getExhibitors() {
    return this._exhibitors;
  }

  Exhibitor getExhibitor(int id) {
    for (Exhibitor e in this._exhibitors) {
      if (e.getId() == id) {
        return e;
      }
    }
    return null;
  }

  List<Performance> getPerformances() {
    return this._performances;
  }

  Performance getPerformance(int id) {
    for (Performance p in this._performances) {
      if (p.getId() == id) {
        return p;
      }
    }
    return null;
  }

}