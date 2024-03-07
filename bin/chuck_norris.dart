 import 'package:chuck_norris/chuck_norris.dart' as chuck_norris;

 void main(List<String> arguments) async {
   final quote = await chuck_norris.getCategoryQuoteByInput();
   print(quote);
 }