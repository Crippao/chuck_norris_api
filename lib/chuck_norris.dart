import "dart:async";
import "dart:ffi";
import "dart:io";
import "package:chuck_norris/models/filtered_quote_list.dart";

import "models/quote.dart";
import "dart:convert";
import "package:http/http.dart" as http;
import 'package:dotenv/dotenv.dart';

String? chooseCategoryByInput() {
  stdout.writeln("1 - animal");
  stdout.writeln("2 - career");
  stdout.writeln("3 - celebrity");
  stdout.writeln("4 - dev");
  stdout.writeln("5 - explicit");
  stdout.writeln("6 - fashion");
  stdout.writeln("7 - food");
  stdout.writeln("8 - history");
  stdout.writeln("9 - money");
  stdout.writeln("10 - movie");
  stdout.writeln("11 - music");
  stdout.writeln("12 - political");
  stdout.writeln("13 - religion");
  stdout.writeln("14 - science");
  stdout.writeln("15 - sport");
  stdout.writeln("16 - travel");
  stdout.writeln(
      'Di che categoria sarà la tua citazione? Inserisci un numero da 1 a 16');
  final input = stdin.readLineSync(encoding: utf8);
  stdout.writeln('You typed: $input');
  return input;
}

String? chooseFilterByInput() {
  stdout.writeln('Digita la parola per la quale filtrare le citazioni: ');
  final input = stdin.readLineSync(encoding: utf8);
  stdout.writeln('You typed: $input');
  return input;
}

Future<String?> convertInputToCategory() async {
  var input = chooseCategoryByInput();

  final urlCategory = "https://api.chucknorris.io/jokes/categories";

  final urlParse = Uri.parse(urlCategory);
  final response = await http.get(urlParse);

  final data = json.decode(response.body);
  //stdout.writeln(data);

  final String category;
  switch (input) {
    case "1":
      category = data[0];
    case "2":
      category = data[1];
    case "3":
      category = data[2];
    case "4":
      category = data[3];
    case "5":
      category = data[4];
    case "6":
      category = data[5];
    case "7":
      category = data[6];
    case "8":
      category = data[7];
    case "9":
      category = data[8];
    case "10":
      category = data[9];
    case "11":
      category = data[10];
    case "12":
      category = data[11];
    case "13":
      category = data[12];
    case "14":
      category = data[13];
    case "15":
      category = data[14];
    case "16":
      category = data[15];
    default:
      return "Hai inserito un numero non compreso nelle possibili scelte";
  }
  //final category = "ciao";
  return category;
}

Future<Quote> getQuote() async {
  const url = "https://api.chucknorris.io/jokes/random";
  final urlParse = Uri.parse(url);
  //stdout.writeln(urlParse);
  final response = await http.get(urlParse);
  //stdout.writeln(response);

  final Map<String, dynamic> data = json.decode(response.body);

  Quote res = Quote(
      quote: data['value'],
      id: data['id'],
      dateOfCreation: data['created_at'],
      category: "random");
  return res;
}

Future<Quote> getCategoryQuoteByEnv() async {
  dynamic res;
  var env = DotEnv(includePlatformEnvironment: true)..load();
  if (env.isEveryDefined(['categories'])) {
    final category = env['categories'];

    //stdout.writeln(category);

    final urlCategory =
        "https://api.chucknorris.io/jokes/random?category=$category";

    final urlParse = Uri.parse(urlCategory);
    final response = await http.get(urlParse);

    final Map<String, dynamic> data = json.decode(response.body);
    //stdout.writeln(data);

    res = Quote(
        quote: data['value'],
        id: data['id'],
        dateOfCreation: data['created_at'],
        category: category);
  }
  return res;
}

Future<Quote> getCategoryQuoteByInput() async {
  final input = await convertInputToCategory();
  final category = input.toString();

  final urlCategory =
      "https://api.chucknorris.io/jokes/random?category=$category";
  final urlParse = Uri.parse(urlCategory);
  final response = await http.get(urlParse);

  final Map<String, dynamic> data = json.decode(response.body);

  Quote res = Quote(
      quote: data['value'],
      id: data['id'],
      dateOfCreation: data['created_at'],
      category: category.toString());

  return res;
}

Future<FilteredQuoteList> getFilteredQuoteByInput() async {
  final input = chooseFilterByInput();

  final urlFilter = "https://api.chucknorris.io/jokes/search?query=$input";
  final urlParse = Uri.parse(urlFilter);
  final response = await http.get(urlParse);

  final Map<String, dynamic> data = json.decode(response.body);
  final list = data['result'] as List;

  List<Quote> quoteList = [];
  for (var i = 0; i < list.length; i++) {
    Quote quote = Quote(
        quote: list[i]['value'],
        id: list[i]['id'],
        dateOfCreation: list[i]['created_at']);

    quoteList.add(quote);
    //print(quoteList);
  }

  FilteredQuoteList res =
      FilteredQuoteList(total: data['total'], results: quoteList);

  return res;
}
