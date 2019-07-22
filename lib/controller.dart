import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:http/http.dart';

import 'model/event.dart';

class DataController {

  String _url;

  DataController(String url) {

    this._url = url;  
  }

  Future checkConnection() async {
    Response response = await http.get('http://' + this._url + '/api');
    return response;
  }

  Future<List<Event>> getEvents() async {
    List<Event> events = new List<Event>();
    Response response = await http.get('http://' + this._url + '/api/events');
    for (var k in json.decode(response.body)) {
      Event e = new Event(k['id'], k['name'], k['tag'], DateTime.parse(k['start_date']), DateTime.parse(k['end_date']));
      events.add(e);
    }
    return events;
  }

}