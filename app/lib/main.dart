import 'package:eventapp/env.dart';
import 'package:eventapp/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


Future<void> main() async {
  var env = EnvironmentVariables();
  await env.load();

  final HttpLink link = HttpLink(
    uri: env.graphQLEndPoint,
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    ),
  );

  return runApp(GraphQLProvider(
    client: client,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event app demo',
      home: HomeScreen(), // TODO: Switch this to Login() once invitations done
      theme: ThemeData.light().copyWith(
        accentColor: Colors.blue[700],
        unselectedWidgetColor: Colors.grey[400],
        cursorColor: Colors.grey[500],
        iconTheme: IconThemeData(
          color: Colors.grey[600],
        ),
        highlightColor: Colors.grey[400],
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.grey[200],
        ),
        buttonColor: Colors.white.withAlpha(175),
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
            letterSpacing: -1,
          ),
          body1: TextStyle(
            fontFamily: 'Inter',
            color: Colors.grey[900],
            letterSpacing: -0.5,
          ),
          body2: TextStyle(
            fontFamily: 'Inter',
            color: Colors.grey[700],
            letterSpacing: -0.5,
          ),
        ),
      ),
    );
  }
}

