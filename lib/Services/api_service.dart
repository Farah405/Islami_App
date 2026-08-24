import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/suras_list.dart';

class ApiService {
  static const String baseUrl = 'https://api.alquran.cloud/v1/surah';

  Future<List<SuraModel>> fetchSuras() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => SuraModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load suras');
    }
  }
}