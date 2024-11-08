import 'dart:convert';
import 'dart:developer';
import 'package:books_app/data/models/author_model.dart';
import 'package:http/http.dart' as http;
import 'package:books_app/core/endpoints.dart';

class AuthorRepoService {
  Future<List<AuthorModel>?> getAuthorsDetails() async {
    final url = Uri.parse("${Endpoints.baseUrl}${Endpoints.authorPath}");
    final header = {
      'accept': '*/*',
    };
    try {
      log('entered in getAuthorsDetails');
      final response = await http.get(url, headers: header);
      log('response =>${response.body}');

      if (response.statusCode == 200) {
        List<AuthorModel> getAuthorList = [];
        final data = jsonDecode(response.body);

        for (var item in data['result']) {
          getAuthorList.add(AuthorModel.fromJson(item));
        }
        return getAuthorList;
      } else {
        return [];
      }
    } catch (e) {
      log('Error in getAuthordetails $e');
    }
    return null;
  }
}
