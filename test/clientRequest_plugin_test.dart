import 'package:network_request/clientRequest_munal.dart';
import 'package:network_request/test_generate_model_by_plugin_entity.dart';
import 'package:test/test.dart';

void main() {

  test('http client request', () async {
    final data = await getData(uri: uri);
    expect(data, isNotEmpty);
    final json = parseJson(data);
    final model = TestGenerateModelByPluginEntity().fromJson(json);

    print('${model.date}');

    print('--- show stories ---');
    for (final story in model.stories) {
      print('${story.title}');
    }

    print('--- show topStories ---');
    for (final story in model.topStories) {
      print('${story.title}');
    }

  });

}