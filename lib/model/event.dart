import 'exhibitor.dart';
import 'performance.dart';

class Event {

  int _id;
  String _name;
  String _tag;
  DateTime _startDate;
  DateTime _endDate;

  List<Exhibitor> _exhibitors;
  List<Performance> _performances;

  Event(int id, String name, String tag, DateTime start, DateTime end) {

    this._id = id;
    this._name = name;
    this._tag = tag;
    this._startDate = start;
    this._endDate = end;

    this._exhibitors = new List<Exhibitor>();
    this._performances = new List<Performance>();

  }

  int getId() {
    return this._id;
  }

  String getName() {
    return this._name;
  }

  String getTag() {
    return this._tag;
  }

  void loadExhibitors() {
    this._exhibitors = new List<Exhibitor>();
  }

  void loadPerformances() {
    this._performances = new List<Performance>();
  }

  void reload() {
    loadExhibitors();
    loadPerformances();
  }

}