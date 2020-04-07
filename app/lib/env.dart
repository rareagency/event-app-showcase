import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentVariables {
  String graphQLEndPoint;

  Future<void> load() async {
    await DotEnv().load('assets/.env');
    var env = DotEnv().env;
    this.graphQLEndPoint = env['GRAPHQL_ENDPOINT'];
  }
}

