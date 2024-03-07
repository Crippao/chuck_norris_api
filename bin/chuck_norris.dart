 import 'package:chuck_norris/chuck_norris.dart' as chuck_norris;

 void main(List<String> arguments) async {
   final quote = await chuck_norris.getCategoryQuoteByEnv();
   print(quote);
 }

// import 'dart:io';

// import 'package:dotenv/dotenv.dart';

// void main() {
//   var env = DotEnv(includePlatformEnvironment: true)..load();

//   p('read all vars? ${env.isEveryDefined(['categories'])}');

//   p('categories=${env['categories']}');
//   p('your home directory is: ${env['HOME']}');

//   env.clear();
//   p('cleared!');

//   p('env has key categories? ${env.isDefined('categories')}');
//   p('your home directory is still: ${env['HOME']}');
// }

// p(String msg) => stdout.writeln(msg);