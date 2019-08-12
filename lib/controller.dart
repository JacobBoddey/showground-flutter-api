import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:http/http.dart';
import 'package:newark_showground_api/model/performance.dart';

import 'model/event.dart';
import 'model/exhibitor.dart';

class DataController {

  String _url;
  List<Event> _events;

  DataController(String url) {

    this._url = url;  
    this._events = new List<Event>();

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

  Future<Event> getEvent(int id) async {
    for (Event e in this._events) {
      if (e.getId() == id) {
        return e;
      }
    } 
    Response response = await http.get('http://' + this._url + '/api/event/' + id.toString());
    var k = json.decode(response.body);
    Event e = new Event(id, k['name'], k['tag'], DateTime.parse(k['start_date']), DateTime.parse(k['end_date']));
    return e;
  }
  
  Future downloadEventData(Event event) async {
    List<Exhibitor> exhibitors = new List<Exhibitor>();
    List<Performance> performances = new List<Performance>();
    Response response = await http.get('http://' + this._url + '/api/event/' + event.getId().toString() + '/download');
    var k = json.decode(response.body)['exhibitors'];
    for (var i in k) {
      exhibitors.add(new Exhibitor(i['id'], i['name'], i['description'], i['url']));
    }
    event.loadExhibitors(exhibitors);
  }

}