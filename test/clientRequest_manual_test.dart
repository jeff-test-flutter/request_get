import 'package:network_request/clientRequest_munal.dart';
import 'package:test/test.dart';

String _jsonString;
Stories _stories;

void main() {
  tearDownAll(() {
    _jsonString = null;
    _stories = null;
  });

  test('http client request', () async {
    final data = await getData(uri: uri);
    expect(data, isNotEmpty);
    _jsonString = data;
  });

  test('json parse directly by manual', () async {
    final jsonMap = parseJson(_jsonString);

    final date = jsonMap['date'];
    expect(date, isNot(null));

    final stories = jsonMap['stories'];
    expect(stories, isNot(null));

    final topStories = jsonMap['top_stories'];
    expect(topStories, isNot(null));
  });

  test('json parse to model by manual', () {
    final jsonMap = parseJson(_jsonString);

    final stories = Stories.fromJson(jsonMap);
    expect(stories.date, isNot(null));
    expect(stories.stories, isNot(null));
    expect(stories.topStories, isNot(null));
    _stories = stories;
  });

  test('model parse to json by manual', () {
    final json = _stories.toJson();

    expect(json, isNot(null));
    print(json);
  });
}
