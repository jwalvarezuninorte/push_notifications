import 'package:flutter/material.dart';
import 'package:push_notifications/screens/home_screen.dart';
import 'package:push_notifications/screens/message_screen.dart';
import 'package:push_notifications/screens/product_screen.dart';
import 'package:push_notifications/sevices/push_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    PushNotificationService.messagesStream.listen((message) {
      print('From main.dart');
      print(message.toString());
      navigatorKey.currentState?.pushNamed(
        message.keys.first,
        arguments: message,
      );

      // final snackBar = SnackBar(content: Text(message));

      // messengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      navigatorKey: navigatorKey, // Navegar
      scaffoldMessengerKey: messengerKey, // Snacks
      routes: {
        'home': (context) => const HomeScreen(),
        'message': (context) => const MessageScreen(),
        'professor': (context) => const ProfessorScreen(),
      },
    );
  }
}
