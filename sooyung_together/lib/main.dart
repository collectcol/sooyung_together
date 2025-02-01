import 'package:flutter/material.dart';
import 'package:sooyung_together/core/network/dio_client.dart';
import 'package:sooyung_together/presentation/screens/home_screen.dart';

import 'data/repositories/medical_institution_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
