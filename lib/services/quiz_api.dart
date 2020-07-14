import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_covid19/models/question.dart';

class QuizApi {
  static Future<List<Question>> fetch() async {
    try {
      var url = 'https://script.googleusercontent.com/macros/echo?user_content_key=0qVhvwMfuV5sKxas2d_Npvcp1t1j1N6SHrSP11maahZ96Cy6vbEaVzO1R_ZoHrRi4JjQsTfyo8AFk9LnQE44mJDFV8g36eUFm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnMbn7OXLoJNeNlW5sBPVzod3gZJ13_i3ItdYRsY2hgDGtThNBCyGoWMji4Wb7bJpbEW-dnclfdIe&lib=MAJRSRMMBFPnAjjGxXR585EZq0LVqQhBG';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Question>.from(
            data["questions"].map((x) => Question.fromMap(x)));
      } else {
        return List<Question>();
      }

    } catch (error) {
      print(error);
      return List<Question>();
    }
  }
}
