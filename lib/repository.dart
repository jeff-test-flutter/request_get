// 參考資料： https://javiercbk.github.io/json_to_dart/
// 參考資料： https://caijinglong.github.io/json2dart/index_ch.html
// 基本上自動生成，或所謂的腳本生成，算是放棄了，至少在沒有「官方」或「權威」的釋出版本之前，就靠最上面參考資料的網頁來快速生成吧！

// 參考資料： https://www.jianshu.com/p/14cbcbaa74b7
// 若真的想要試試自動生成 model 的話，就使用上面參考資料的套件吧

import 'package:network_request/clientRequest_munal.dart' as ClientRequest;
import 'package:network_request/test_generate_model_by_plugin_entity.dart';
import 'package:rxdart/rxdart.dart';

class StoryRepository {
  static final StoryRepository _instance = StoryRepository._();

  StoryRepository._();

  static StoryRepository get shared => _instance;

  factory StoryRepository() => shared;

  Stream<ClientRequest.Stories> getStoryDataWithManualModel() {
    final data = ClientRequest.getData(uri: ClientRequest.uri);
    return Observable.fromFuture(data)
        .map(
          (json) =>
          ClientRequest.Stories.fromJson(
            ClientRequest.parseJson(json),
          ),
    )
        .doOnListen(
          () => print('doOnListen'),
    )
        .doOnDone(
          () => print('doOnDone'),
    );
  }

  Stream<TestGenerateModelByPluginEntity> getStoryDataWithPluginModel() {
    final data = ClientRequest.getData(uri: ClientRequest.uri);
    TestGenerateModelByPluginEntity();
    return Observable.fromFuture(data)
        .map(
          (json) => TestGenerateModelByPluginEntity().fromJson(json),
    )
        .doOnListen(
          () => print('doOnListen'),
    )
        .doOnDone(
          () => print('doOnDone'),
    );
  }
}
