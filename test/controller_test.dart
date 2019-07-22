import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:newark_showground_api/controller.dart';
import 'package:newark_showground_api/model/event.dart';

void main() {
  group('Controller', () {

    test('Connection to API should be successful - status code 200', () async {
        final controller = new DataController('152.71.155.90');
        Response response = await controller.checkConnection();
        expect(response.statusCode, 200);
      });

    test('Obtain list of events - non-empty list', () async {
      final controller = new DataController('152.71.155.90');
      List<Event> events = await controller.getEvents();
      expect(events.length, greaterThan(0));
    });

  });
}