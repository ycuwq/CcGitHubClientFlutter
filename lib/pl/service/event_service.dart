import 'package:ccgithubclientflutter/pl/model/Event.dart';
import 'package:ccgithubclientflutter/pl/model/User.dart';
import 'package:ccgithubclientflutter/pl/network/http.dart';
import 'package:ccgithubclientflutter/pl/service/address.dart';

class EventService {
  static Future<List<Event>> getUserEvents(String userName) async {
    String url = "users/$userName/events";
    final res = await Http().get(url);
    List<Event> events = List();
    if (res != null && res.result && res.data.length > 0) {
      for (int i = 0; i < res.data.length; i++) {
        var data = res.data[i];
        Event event = Event.fromJson(data);
        events.add(event);
      }
    }
    return events;
  }

  static Future<List<Event>> getUserReceivedEvents(String userName, int page) async {
    String url = "users/$userName/received_events" + Address.getPageParams("?", page);
    final res = await Http().get(url);
    List<Event> events = List();
    if (res != null && res.result && res.data.length > 0) {
      for (int i = 0; i < res.data.length; i++) {
        var data = res.data[i];
        Event event = Event.fromJson(data);
        events.add(event);
      }
    }
    return events;
  }

}