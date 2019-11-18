import 'dart:convert';
import 'dart:io';

final _host = 'news-at.zhihu.com';
final uri = Uri.http(_host, '/api/3/stories/latest');

Future getData({Uri uri}) async {
  final httpClient = HttpClient();
  final request = await httpClient.getUrl(uri);
  final response = await request.close();
  return await response.transform(utf8.decoder).join();
}

Map parseJson(String jsonString) {
  final jsonMap = jsonDecode(jsonString);
  return jsonMap;
}

class Story {
  final String imageHue;
  final String title;
  final String url;
  final String hint;
  final String gaPrefix;
  final List<String> images;
  final String type;
  final String id;

  Story(
      {this.imageHue,
      this.title,
      this.url,
      this.hint,
      this.gaPrefix,
      this.images,
      this.type,
      this.id});

  Story.fromJson(Map<String, dynamic> json)
      : imageHue = json['image_hue'],
        title = json['title'],
        url = json['url'],
        hint = json['hint'],
        gaPrefix = json['ga_prefix'],
        images =
            (json['images'] as List).map((image) => image as String).toList(),
        type = json['type'].toString(),
        id = json['id'].toString();
}

class TopStory {
  final String imageHue;
  final String title;
  final String url;
  final String hint;
  final String gaPrefix;
  final String image;
  final String type;
  final String id;

  TopStory(
      {this.imageHue,
      this.title,
      this.url,
      this.hint,
      this.gaPrefix,
      this.image,
      this.type,
      this.id});

  TopStory.fromJson(Map<String, dynamic> json)
      : imageHue = json['image_hue'],
        title = json['title'],
        url = json['url'],
        hint = json['hint'],
        gaPrefix = json['ga_prefix'],
        image = json['image'],
        type = json['type'].toString(),
        id = json['id'].toString();
}

class Stories {
  String date;
  List<Story> stories;
  List<TopStory> topStories;

  Stories({this.date, this.stories, this.topStories});

  Stories.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        stories = (json['stories'] as List)
            .map((story) => Story.fromJson(story as Map<String, dynamic>))
            .toList(),
        topStories = (json['top_stories'] as List)
            .map((topStory) =>
                TopStory.fromJson(topStory as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'date': date, 'stories': stories, 'topStories': topStories};
}
