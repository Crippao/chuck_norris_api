import 'package:chuck_norris/models/quote.dart';

class FilteredQuoteList {
  int total;
  List<Quote> results;

  FilteredQuoteList({required this.total, required this.results});

  @override
  String toString() {
    String data = "Numer of quotes find: $total; List of quotes: $results";
    return data;
  }
}