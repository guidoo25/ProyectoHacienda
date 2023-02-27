

import 'dart:io';

class Enviroments {
  static String apiUrl = Platform.isAndroid ? 'http://10.0.2.2:3636/api': 'http://localhost:3636/api';
}