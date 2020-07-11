import 'package:ccgithubclientflutter/pl/model/Event.dart';
import 'package:ccgithubclientflutter/pl/service/event_service.dart';

class EventRepository {
  static Future<List<Event>> getUserEvents(String userName) async {
      return EventService.getUserEvents(userName);
  }

  static Future<List<Event>> getUserReceivedEvents(String userName, int page) async {
    return EventService.getUserReceivedEvents(userName, page);
  }
}