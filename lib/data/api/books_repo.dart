import 'dart:convert';
import 'dart:developer';

import 'package:books_app/core/endpoints.dart';
import 'package:books_app/data/models/book_model.dart';
import 'package:http/http.dart' as http;

class BooksRepoService {
  Future<List<BookModel>?> fetchBookFromApi(
      {int limit = 10, int page = 1}) async {
    final url =
        Uri.parse('${Endpoints.baseUrl}${Endpoints.fetchBooks}?').replace(
      queryParameters: {
        "page": page.toString(),
        "limit": limit.toString(),
      },
    );
    final header = {
      'accept': '*/*',
    };
    try {
      log('here came');
      final response = await http.get(url, headers: header);
      log('Response => ${response.statusCode} fecthbookfromapi');

      if (response.statusCode == 200) { 
        List<BookModel> getBookList = [];
        final data = jsonDecode(response.body);

        for (var item in data['result']) {
          getBookList.add(BookModel.fromJson(item));
        }

        return getBookList;
      } else if (response.statusCode == 400) {
        throw Exception("Invalid request. Please try again.");
      } else if (response.statusCode == 404) {
        throw Exception("No books found.");
      } else if (response.statusCode == 500) {
        throw Exception("Server error. Please try again later.");
      } else {
        throw Exception("Unexpected error: ${response.statusCode}");
      }
    } catch (e) {
      log('Error in Fetchbook api $e');
    }
    return null;
  }
  Future<String>getAuthorName({required String authorId})async{
    final url =Uri.parse('${Endpoints.baseUrl}${Endpoints.authorPath}/$authorId');
    final header ={
      "accept": "*/*"
    };
    try {
      final response =await http.get(url,headers: header);
      log('Response from get authorname =>$response');
      final responseBody =jsonDecode(response.body);
      final String? authorname =responseBody['result']['name'];
      return authorname??'Unknown';
    } catch (e) {
      log('Error in Getauthorname =>$e');
      return 'user Unknown';
    }
  }
}