# Showground API

## Getting Started

The following initialises the data controller class and ensures the connection is made.

### Imports:
	
~~~~
import 'package:http/http.dart';
import 'controller.dart';
~~~~

### Create new data controller:
~~~~

final host = '127.0.0.1';
DataController controller = new DataController(host);

Response response = await controller.checkConnection();
if (response.statusCode == 200) {
    //Connection has been made
}
else {
    //Connection failed
}

~~~~

## Events

### Imports:

~~~
import 'model/event.dart';
~~~

### Get all events:
~~~~ 
List<Event> events = controller.getEvents();
~~~~

### Get an event by ID:
~~~~
Event midlandsShow = controller.getEvent(id);
~~~~

### Get Exhibitors and Performances:

~~~~
import 'model/exhibitor';
import 'model/performance';

List<Exhibitor> exhibitors = midlandsShow.getExhibitors();
List<Performance> performances = midlandsShow.getPerformances;
~~~~

## Exhibitors

### Imports:

~~~
import 'model/exhibitor.dart';
~~~

### Available functions:

~~~~
getId();
getName();
getDescription():
getUrl();
~~~~
