// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/widgets/landing_page.dart';
import 'package:provider/provider.dart';

import 'data/services/my_firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    Provider<AuthenticationService>(
      create: (_) => AuthenticationService(),
    ),
    StreamProvider(
      create: (context) =>
          context.read<AuthenticationService>().authStateChanges,
      initialData: [],
    )
  ], child: App()));
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidget("Error initializing FlutterFire!");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              theme: ThemeData(primarySwatch: Colors.green),
              home: LandingPage(),
              debugShowCheckedModeBanner: false);
        }
        // Otherwise, show something while waiting for initialization to complete
        return CircularProgressIndicator.adaptive();
      },
    );
  }
}
