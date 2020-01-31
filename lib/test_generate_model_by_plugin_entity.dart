import 'package:network_request/generated/json/base/json_convert_content.dart';
import 'package:network_request/generated/json/base/json_filed.dart';

class TestGenerateModelByPluginEntity with JsonConvert<TestGenerateModelByPluginEntity> {
	String date;
	List<TestGenerateModelByPluginStory> stories;
	@JSONField(name: "top_stories")
	List<TestGenerateModelByPluginTopStory> topStories;
}

class TestGenerateModelByPluginStory with JsonConvert<TestGenerateModelByPluginStory> {
	@JSONField(name: "image_hue")
	String imageHue;
	String title;
	String url;
	String hint;
	@JSONField(name: "ga_prefix")
	String gaPrefix;
	List<String> images;
	int type;
	int id;
}

class TestGenerateModelByPluginTopStory with JsonConvert<TestGenerateModelByPluginTopStory> {
	@JSONField(name: "image_hue")
	String imageHue;
	String hint;
	String url;
	String image;
	String title;
	@JSONField(name: "ga_prefix")
	String gaPrefix;
	int type;
	int id;
}
