// https://medium.com/@lihsinplayer/flutter-如何寫測試案例-5a41bad314fb
// https://flutter.dev/docs/cookbook/testing/unit/introduction
// https://medium.com/@lihsinplayer/swift的uitest和unittest怎麼寫-5758fda2c2e0

import 'package:test/test.dart';
import 'package:network_request/count.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}