import "models/quote.dart"; 
import "dart:convert";
import "package:http/http.dart" as http; 

const url = "https://api.chucknorris.io/jokes/random";
const urlCategory = "https://api.chucknorris.io/jokes/random?category={animal}";

Future<Quote> getQuote() async {
  final urlParse = Uri.parse(url);
  final response = await http.get(urlParse); 
  //Future è l'equivalente di una promise, non ho al suo interno il suo valore ORA, ma so che lo avrò in futuro. 
  //Per questo ho bisogni di indicare che ho necessità di avere dell'asincronicità, inserendo le keyword ASYNC AWAIT.

  final Map<String, dynamic> data = json.decode(response.body); 
  //dynamic è una tipologia di oggetto che può essere un po di tutto
  
  Quote res = Quote(quote:data['value'],id:data['id'],dateOfCreation:data['created_at']);
  return res;
}

//cercare libreria per caricare file env
Future<Quote> getCategoryQuote() async {
  final urlParse = Uri.parse(url);
  final response = await http.get(urlParse); 
  //Future è l'equivalente di una promise, non ho al suo interno il suo valore ORA, ma so che lo avrò in futuro. 
  //Per questo ho bisogni di indicare che ho necessità di avere dell'asincronicità, inserendo le keyword ASYNC AWAIT.

  final Map<String, dynamic> data = json.decode(response.body); 
  //dynamic è una tipologia di oggetto che può essere un po di tutto
  
  Quote res = Quote(quote:data['value'],id:data['id'],dateOfCreation:data['created_at']);
  return res;
}