import 'package:flutter/material.dart';
import 'package:sooyung_together/core/network/dio_client.dart';
import 'package:sooyung_together/presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
