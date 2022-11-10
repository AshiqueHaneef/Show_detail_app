import 'package:show_detail_app/data/api.dart';
import 'package:show_detail_app/models/cast.dart';
import 'package:show_detail_app/models/show_detail.dart';

String SHOW_URL = "https://api.tvmaze.com/shows";
String CAST_URL = "https://api.tvmaze.com/shows/";

class Repository {
  static Future<List<ShowDetail>> fetchShowDetail() async {
    try {
      List<dynamic>? data = await API.get(SHOW_URL);
      final dataList = data?.map((e) => ShowDetail.fromMap(e)).toList();
      return dataList as List<ShowDetail>;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<Cast>> fetchCast(String id) async {
    try {
      List<dynamic>? data = await API.get("$SHOW_URL/$id/cast");

      var dataList =
          data?.map((e) => Cast.fromMap(e as Map<String, dynamic>)).toList();

      return dataList as List<Cast>;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
