import 'package:http/http.dart' as http;
import 'dart:convert';

/* * functional description: handles network requests for user authentication.
 * state modification: none.
 * behavioral logic: 
 * - sends post requests to the node.js backend.
 * - handles socket exceptions if the server is unreachable.
 * - returns a boolean or a response object based on status code.
 * usage: `bool success = await authservice.signup(email, pass);`
 * parameters:
 * - email: the user's input email string.
 * - password: the user's input password string.
 * returns:
 * - future<bool>: true if account created/authenticated, false otherwise.
 */


class AuthService {
  // the address of the node.js server

  final String baseurl = 'http://10.0.2.2:3000/auth';
  Future<String> signup(String email, String password) async {
    // 1. the url where the request is going
    try {
      final url = Uri.parse('$baseurl/signup');

      // 2. the headers telling the server we are sending json
      final headers = {'content-type': 'application/json'};

      // 3. the body containing the actual data
      final body = jsonEncode({'email': email, 'password': password});
      final response = await http.post(url, headers: headers, body: body);
      return response.body;
    } catch (err) {
      return 'error $err';
    }
  }
}
