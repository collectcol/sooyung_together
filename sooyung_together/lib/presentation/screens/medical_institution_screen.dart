import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sooyung_together/data/models/status_medical_institudtions_model.dart';

import '../../core/network/dio_client.dart';
import '../../data/repositories/medical_institution_repository.dart';

class MedicalInstitutionScreen extends StatefulWidget {
  const MedicalInstitutionScreen({
    super.key,
  });

  @override
  State<MedicalInstitutionScreen> createState() =>
      _MedicalInstitutionScreenState();
}

class _MedicalInstitutionScreenState extends State<MedicalInstitutionScreen> {
  final MedicalRepository _repository = MedicalRepository();
  List<MedicalInstitution> _institutions = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchMedicalInstitutions() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final institutions = await _repository.getMedicalInstitutions();
      setState(() {
        _institutions = institutions;
      });
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('의료기관 목록'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _institutions.length,
              itemBuilder: (context, index) {
                final institution = _institutions[index];
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '의료기관종별: ${institution.type}',
                          ),
                          Text(
                            '의료기관명: ${institution.name}',
                          ),
                        ],
                      ),
                      Text(
                        '의료기관전화번호: ${institution.phoneNumber}',
                      ),
                      Text(
                        '의료기관주소(도로명): ${institution.address}',
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
