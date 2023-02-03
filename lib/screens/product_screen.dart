import 'package:flutter/material.dart';

class ProfessorScreen extends StatelessWidget {
  const ProfessorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'Cargar info profesor : $args',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
