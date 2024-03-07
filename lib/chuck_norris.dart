import "dart:ffi";
import "dart:io";
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
  stdout.writeln('Di che categoria sarà la tua citazione? Inserisci un numero da 1 a 16');
  final input = stdin.readLineSync();
  stdout.writeln('You typed: $input'); //, the choosen category is $category[$input]');
  return input;
}

Future<Quote> getQuote() async {
  const url = "https://api.chucknorris.io/jokes/random";
  final urlParse = Uri.parse(url);
  //stdout.writeln(urlParse);
  final response = await http.get(urlParse); 
  //stdout.writeln(response);

  final Map<String, dynamic> data = json.decode(response.body); 
  
  Quote res = Quote(quote:data['value'],id:data['id'],dateOfCreation:data['created_at'], category:"random");
  return res;
}

Future<Quote> getCategoryQuoteByEnv () async {
  dynamic res;
  var env = DotEnv(includePlatformEnvironment: true)..load();
  if(env.isEveryDefined(['categories'])){
    final category = env['categories'];
    
    //stdout.writeln(category);   

    final urlCategory = "https://api.chucknorris.io/jokes/random?category=$category";

    final urlParse = Uri.parse(urlCategory);
    final response = await http.get(urlParse); 

    final Map<String, dynamic> data = json.decode(response.body); 
    //stdout.writeln(data);
  
    res = Quote(quote:data['value'],id:data['id'],dateOfCreation:data['created_at'], category:category);
  }
  return res;  
}