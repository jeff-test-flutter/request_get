import 'package:network_request/clientRequest_munal.dart';
import 'package:rxdart/rxdart.dart';

class StoryRepository {
  static final StoryRepository _instance = StoryRepository._();

  StoryRepository._();

  static StoryRepository get shared => _instance;

  factory StoryRepository() => shared;

  Stream<Stories> getStoryData() {
    final data = getData(uri: uri);
    return Observable.fromFuture(data)
        .map(
          (json) => Stories.fromJson(
            parseJson(json),
          ),
        )
        .doOnListen(
          () => print('doOnListen'),
        )
        .doOnDone(
          () => print('doOnDone'),
        );
  }
}
