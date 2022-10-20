import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => 'env/.env';

  static String get applicationId => dotenv.env['APPLICATION_ID'] ?? 'NOT FOUND';
  static String get apiKey => dotenv.env['API_KEY'] ?? 'NOT FOUND';
}
