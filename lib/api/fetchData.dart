import 'dart:convert';
import 'package:http/http.dart' as http;


class FetchData {
  String userMessage;
  FetchData(this.userMessage);

  Future<String> returnMessage(userMessage) async {
    final url = Uri.parse('https://chatgpt-42.p.rapidapi.com/conversationgpt4-2');
    final headers = {
      'x-rapidapi-key': '3791a9c7f7msha3c2788e271b43bp13e136jsn41e97d89e3de',
      'x-rapidapi-host': 'chatgpt-42.p.rapidapi.com',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      "messages": [
        {"role": "user", "content": userMessage}
      ],
      "system_prompt": "You are a supportive assistant, ensuring that all messages are clear and free of encoding errors. Provide positive and one liner responses without special symbols.",
      "temperature": 0.9,
      "top_k": 5,
      "top_p": 0.9,
      "max_tokens": 256,
      "web_access": false
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // Process the response
        final jsonResponse = jsonDecode(response.body);

        String result = jsonResponse['result'];
        print('Response: ${response.body}');
        return result;
      } else {
        print('Failed with status code: ${response.statusCode}');
        return 'Failed with status code: ${response.statusCode}';
      }
    } catch (e) {
      print('Error: $e');
      return 'Error: $e';
    }
  }

}
