import 'package:flutter/material.dart';
import 'package:sooyung_together/presentation/screens/medical_institution_screen.dart';

import '../../core/constants/category.dart';
import '../../core/constants/color.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontFamily: 'NanumGothic',
  );

  final Map<String, bool> expandedCategory = {};

  @override
  void initState() {
    super.initState();

    for (var category in Category) {
      expandedCategory[category.toString()] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: Category.map(
                  (e) => GestureDetector(
                    onTap: () {
                      setState(() {
                        expandedCategory[e.toString()] =
                            !(expandedCategory[e.toString()] ?? false);
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return MedicalInstitutionScreen();
                        },
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: primaryBackgroundColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.toString(),
                              style: textStyle,
                            ),
                            Icon(
                              expandedCategory[e.toString()] ?? false
                                  ? Icons.arrow_drop_down_outlined
                                  : Icons.arrow_right_outlined,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
