import 'package:flutter/material.dart';
import 'package:sooyung_together/data/models/famous_restaurant_model.dart';
import 'package:sooyung_together/data/repositories/famous_restaurant_repository.dart';

import '../../core/constants/per_page.dart';
import '../../core/states/pagination_state.dart';
import '../../data/models/medical_institudtions_model.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/pagination.dart';

class FamousRestaurantScreen extends StatefulWidget {
  final String title;

  FamousRestaurantScreen({
    super.key,
    required this.title,
  });

  @override
  State<FamousRestaurantScreen> createState() => _FamousRestaurantScreenState();
}

class _FamousRestaurantScreenState extends State<FamousRestaurantScreen> {
  final PaginationState _paginationState = PaginationState();
  late FamousRestaurantRepository _repository;
  List<FamousRestaurant> _dataList = [];
  LanguageType _selectedLanguage = LanguageType.korean;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initRepository();
    fetchMedicalInstitutions();
  }

  void _initRepository() {
    _repository = FamousRestaurantRepository(
      page: _paginationState.currentPage,
      perPage: _paginationState.perPage,
      language: _selectedLanguage,
    );
  }

  Future<void> fetchMedicalInstitutions() async {
    setState(() => _isLoading = true);
    try {
      final response = await _repository.getItems();
      debugPrint('Response: ${response.items.length}');  // 데이터 확인
      debugPrint('First item: ${response.items.firstOrNull?.mainTitle}');
      setState(() {
        _dataList = response.items;
        _paginationState.totalCount = response.totalCount;
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
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                _buildControlsRow(),
                _buildDataList(),
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
        _buildLanguageDropdown(),
      ],
    ),
  );

  Widget _buildPerPageDropdown() => CustomDropdown<PerPage>(
    items: PerPage.values.toList(),
    initialValue: _paginationState.getCurrentPerPage(),
    onChanged: _handlePerPageChange,
    displayName: (item) => '${item.valueToNumber}개씩',
  );

  Widget _buildLanguageDropdown() => CustomDropdown<LanguageType>(
    items: LanguageType.values,
    initialValue: _selectedLanguage,
    onChanged: (value) {
      setState(() {
        _selectedLanguage = value;
        _initRepository();
        fetchMedicalInstitutions();
      });
    },
    displayName: (item) => item.name,  // 'Korean', 'English' 등
  );

  Widget _buildDataList() => Expanded(
    child: ListView.builder(
      itemCount: _dataList.length,
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
    final data = _dataList[index];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Container(
          child: Column(
            children: [
              Text('MainTitle : ${data.mainTitle}'),
              Text('GuGunName : ${data.gugunNm}'),
              Text('LAT : ${data.lat}'),
              Text('LNG : ${data.lng}'),
              Text('PLACE : ${data.place}'),
              Text('TITLE : ${data.title}'),
              Text('SUBTITLE : ${data.subtitle}'),
              Text('ADDR1 : ${data.addr1}'),
              Text('ADDR2 : ${data.addr2}'),
              Text('CNTCT_TEL : ${data.contactTel}'),
              Text('HOMEPAGE_URL : ${data.homepageUrl}'),
              Text('USAGE_DAY_WEEK_AND_TITLE : ${data.usageDayWeekAndTime}'),
              Text('RPRSNTV_MENU : ${data.representativeMenu}'),
              Text('ITEMCNTNTS : ${data.itemContents}'),
              Text('LAT : ${data.lat}'),
            ],
          ),
        ),

      ),
    );
  }

  void _handlePerPageChange(PerPage value) {
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
