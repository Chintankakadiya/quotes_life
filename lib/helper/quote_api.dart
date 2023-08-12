import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes_life/modal/quote_modal.dart';

class QuotesAPIHelper {
  QuotesAPIHelper._();
  static final QuotesAPIHelper quotesAPIHelper = QuotesAPIHelper._();

  Future<List<Quotes>?> fetchQuotes() async {
    http.Response response = await http
        .get(Uri.parse('https://api.quotable.io/quotes?maxLength=50'));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodeData = jsonDecode(response.body);
      List<dynamic> data = decodeData['results'];
      List<Quotes> myQuotes = data.map((e) => Quotes.fromMap(data: e)).toList();
      return myQuotes;
    }
    return null;
  }
}
