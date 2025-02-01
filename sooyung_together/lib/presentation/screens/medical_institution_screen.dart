import 'package:flutter/material.dart';
import 'package:sooyung_together/data/models/status_medical_institudtions_model.dart';
import 'package:sooyung_together/presentation/widgets/custom_dropdown.dart';
import '../../data/repositories/medical_institution_repository.dart';
import '../widgets/pagination.dart';

class MedicalInstitutionScreen extends StatefulWidget {
  final String title;

  const MedicalInstitutionScreen({super.key, required this.title});

  @override
  State<MedicalInstitutionScreen> createState() =>
      _MedicalInstitutionScreenState();
}

class _MedicalInstitutionScreenState extends State<MedicalInstitutionScreen> {
  // 페이지네이션 관련 상태
  final PaginationState _paginationState = PaginationState();
  late MedicalRepository _repository;
  List<MedicalInstitution> _institutions = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initRepository();
    fetchMedicalInstitutions();
  }

  void _initRepository() {
    _repository = MedicalRepository(
      page: _paginationState.currentPage,
      perPage: _paginationState.perPage,
    );
  }

  Future<void> fetchMedicalInstitutions() async {
    setState(() => _isLoading = true);
    try {
      final institutions = await _repository.getMedicalInstitutions();
      setState(() {
        _institutions = institutions;
        _paginationState.totalCount = _repository.totalCount;
      });
    } catch (e) {
      _showErrorMessage();
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showErrorMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('데이터를 불러오는데 실패했습니다.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildControlsRow(),
                _buildInstitutionsList(),
                _buildPagination(),
              ],
            ),
    );
  }

  Widget _buildControlsRow() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            _buildPerPageDropdown(),
            _buildTypeDropdown(),
          ],
        ),
      );

  Widget _buildPerPageDropdown() => CustomDropdown<PerPageMedicalInstitution>(
        items: PerPageMedicalInstitution.values.toList(),
        initialValue: _paginationState.getCurrentPerPage(),
        onChanged: _handlePerPageChange,
        displayName: (item) => '${item.valueToNumber}개씩',
      );

  Widget _buildTypeDropdown() => CustomDropdown<TypeOfMedicalInstitution>(
        items: TypeOfMedicalInstitution.values.toList(),
        initialValue: TypeOfMedicalInstitution.values.first,
        onChanged: (_) {},
        displayName: (item) => item.KrName,
      );

  Widget _buildInstitutionsList() => Expanded(
        child: ListView.builder(
          itemCount: _institutions.length,
          itemBuilder: _buildInstitutionCard,
        ),
      );

  Widget _buildPagination() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: CustomPagination(
          currentPage: _paginationState.currentPage,
          totalPages: _paginationState.totalPages,
          onPageChanged: _handlePageChange,
        ),
      );

  Widget _buildInstitutionCard(BuildContext context, int index) {
    final institution = _institutions[index];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text('의료기관종별: ${institution.type}'),
                  ),
                  Text('의료기관명: ${institution.name}'),
                ],
              ),
              Row(
                children: [
                  Text('의료기관전화번호: ${institution.phoneNumber}'),
                ],
              ),
              Row(
                children: [
                  Text('의료기관주소(도로명): ${institution.address}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePerPageChange(PerPageMedicalInstitution value) {
    setState(() {
      _paginationState.perPage = value.valueToNumber;
      _initRepository();
      fetchMedicalInstitutions();
    });
  }

  void _handlePageChange(int page) {
    setState(() {
      _paginationState.currentPage = page;
      _initRepository();
      fetchMedicalInstitutions();
    });
  }
}

// 페이지네이션 상태 관리 클래스
class PaginationState {
  int currentPage = 1;
  int perPage = 10;
  int totalCount = 0;

  int get totalPages => (totalCount / perPage).ceil();

  PerPageMedicalInstitution getCurrentPerPage() {
    return PerPageMedicalInstitution.values.firstWhere(
      (element) => element.valueToNumber == perPage,
      orElse: () => PerPageMedicalInstitution.values.first,
    );
  }
}
