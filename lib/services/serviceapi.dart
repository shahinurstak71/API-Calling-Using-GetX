import 'package:apicallgetx/model/commentsmodel.dart';
import 'dart:async';
import 'package:http/http.dart'as http;
import 'dart:convert'as convert;

class Services{
  Future<List<Welcome>?> getallcomment() async{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
   try {
      var response = await http
          .get(url)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        List jsonresponse = convert.jsonDecode(response.body);
        return jsonresponse.map((e) => new Welcome.fromJson(e)).toList();
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }


  }
}