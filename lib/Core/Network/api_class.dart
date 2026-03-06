import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClass {

    Future<List<dynamic>> getData(String url) async{

      try {
        final response = await http.get(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"}
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);

          return data;
        } else {
          throw Exception("Some Error while getting data");
        }
      }catch(e){

        throw Exception("Exception$e");
      }



    }

    Future<Map<String,dynamic>> postData(
        String url,
        {required Map<String,dynamic> body})async{

try {
  final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body)

  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Some error while parsing");
  }
}catch(e){
  throw Exception("The problem is $e");
}



    }

}