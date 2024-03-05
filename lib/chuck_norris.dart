import "models/quote.dart"; 
import "dart:convert";
import "package:http/http.dart" as http; 

const url = "https://api.chucknorris.io/jokes/random";
const urlCategory = "https://api.chucknorris.io/jokes/random?category={animal}";

Future<Quote> getQuote() async {
  final urlParse = Uri.parse(url);
  final response = await http.get(urlParse); 

  final Map<String, dynamic> data = json.decode(response.body); 
  
  Quote res = Quote(quote:data['value'],id:data['id'],dateOfCreation:data['created_at']);
  return res;
}

//cercare libreria per caricare file env
Future<Quote> getCategoryQuote() async {
  final urlParse = Uri.parse(url);
  final response = await http.get(urlParse); 

  final Map<String, dynamic> data = json.decode(response.body); 
  
  Quote res = Quote(quote:data['value'],id:data['id'],dateOfCreation:data['created_at']);
  return res;
}