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

### Download event data:

~~~~
int eventId = 1;
controller.downloadEventData(eventId);
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
getDescription();
getUrl();
~~~~

## Performances

### Imports:

~~~
import 'model/performance.dart';
~~~

### Available functions:

~~~~
getId();
getName();
getPresenter();
getType();
getLocation();
~~~~
