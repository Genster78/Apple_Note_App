import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            //heading
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Notes',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // list of notes
            
          ],
        ),
      ),
    );
  }
}
