import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendMessage() async {
  final url = Uri.parse('https://chatgpt-42.p.rapidapi.com/conversationgpt4-2');
  final headers = {
    'x-rapidapi-key': '3791a9c7f7msha3c2788e271b43bp13e136jsn41e97d89e3de',
    'x-rapidapi-host': 'chatgpt-42.p.rapidapi.com',
    'Content-Type': 'application/json',
  };
  final body = jsonEncode({
    "messages": [
      {"role": "user", "content": "hello"}
    ],
    "system_prompt": "",
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
      print('Response: ${response.body}');
    } else {
      print('Failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
