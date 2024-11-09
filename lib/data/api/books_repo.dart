import 'dart:convert';
import 'dart:developer';

import 'package:books_app/core/endpoints.dart';
import 'package:books_app/data/models/book_model.dart';
import 'package:http/http.dart' as http;

class BooksRepoService {

  // BOOKS FETCHING FROM API ---
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
      final response = await http.get(url, headers: header);
      log('Response => ${response.body} fecthbookfromapi');

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
 
  // GET AUTHOR NAMES ---
  Future<String> getAuthorName({required String authorId}) async {
    final url =
        Uri.parse('${Endpoints.baseUrl}${Endpoints.authorPath}/$authorId');
    final header = {
      "accept": "*/*",
    };
    try {
      final response = await http.get(url, headers: header);

      log('Response from get authorname =>$response');

      final responseBody = jsonDecode(response.body);

      final String? authorname = responseBody['result']['name'];

      return authorname ?? 'Unknown';
    } catch (e) {
      log('Error in Getauthorname =>$e');
      return 'user Unknown';
    }
  }

  Future<int?> addStarRating(String bookId, int rating, String accessToken) async {
    // Construct the URL with the specific book ID
    final url = Uri.parse('${Endpoints.baseUrl}${Endpoints.fetchBooks}/$bookId?/ratings:add');

    try {
      // Make the PATCH request
      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
          'accept': '*/*'
        },
        body: jsonEncode({'rating': rating,}),
      );

      // Handle the response
      if (response.statusCode == 200) {
        print('Rating added successfully.');
        return response.statusCode;
      } else {
        print('Failed to add rating: ${response.statusCode}');
        print('Response: ${response.body}');
        return response.statusCode;
      }
    } catch (e) {
      print('An error occurred: $e');
      return 0;
    }
  }
}
