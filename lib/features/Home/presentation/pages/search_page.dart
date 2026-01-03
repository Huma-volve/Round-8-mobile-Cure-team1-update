import 'dart:async';

import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../Data/models/doctor_api_model.dart';
import '../../Data/models/specialty_model.dart';
import '../state/favorite_store.dart';
import '../widgets/doctor_item.dart';

class DoctorsSearchPage extends StatefulWidget {
  final String? initialQuery;
  final String? initialSpecialty;

  const DoctorsSearchPage({
    super.key,
    this.initialQuery,
    this.initialSpecialty,
  });

  @override
  State<DoctorsSearchPage> createState() => _DoctorsSearchPageState();
}

class _DoctorsSearchPageState extends State<DoctorsSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  bool _isLoading = false;
  String? _error;
  List<ApiDoctor> _doctors = [];
  String? _selectedSpecialty;

  @override
  void initState() {
    super.initState();
    _selectedSpecialty = widget.initialSpecialty;
    final initialText = widget.initialQuery?.trim().isNotEmpty == true
        ? widget.initialQuery!.trim()
        : (widget.initialSpecialty ?? '');
    _searchController.text = initialText;
    if (initialText.isNotEmpty) {
      _searchDoctors(initialText);
    }
    FavoriteStore.ensureSynced();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    final query = value.trim();
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      _searchDoctors(query);
    });
  }

  Future<void> _searchDoctors(String query) async {
    if (query.isEmpty) {
      setState(() {
        _doctors = [];
        _error = null;
        _isLoading = false;
      });
      return;
    }

    final token = Cachehelper.getToken();
    if (token == null || token.isEmpty) {
      setState(() {
        _doctors = [];
        _error = 'Please log in to search doctors.';
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final api = getIt<ApiServices>();
      final encoded = Uri.encodeQueryComponent(query);
      final response = await api.get('doctors?search=$encoded');
      final doctors = _parseDoctors(response);
      if (!mounted) return;
      setState(() {
        _doctors = doctors;
        _isLoading = false;
      });
    } on DioException catch (error) {
      if (!mounted) return;
      setState(() {
        _error = _extractDioMessage(error);
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = 'Failed to load doctors. Try again.';
        _isLoading = false;
      });
    }
  }

  List<ApiDoctor> _parseDoctors(dynamic response) {
    if (response is Map<String, dynamic>) {
      final data = response['data'];
      if (data is List) {
        return data
            .whereType<Map<String, dynamic>>()
            .map(ApiDoctor.fromJson)
            .toList();
      }
    }
    return <ApiDoctor>[];
  }

  String _extractDioMessage(DioException error) {
    if (error.response?.statusCode == 401) {
      return 'Please log in to search doctors.';
    }
    final data = error.response?.data;
    if (data is String && data.isNotEmpty) {
      return data;
    }
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
      final errors = data['errors'];
      if (errors is Map<String, dynamic> && errors.isNotEmpty) {
        final firstEntry = errors.values.first;
        if (firstEntry is List && firstEntry.isNotEmpty) {
          final firstMessage = firstEntry.first;
          if (firstMessage is String && firstMessage.isNotEmpty) {
            return firstMessage;
          }
        }
        if (firstEntry is String && firstEntry.isNotEmpty) {
          return firstEntry;
        }
      }
    }
    return error.message ?? 'Failed to load doctors. Try again.';
  }

  void _selectSpecialty(String name) {
    setState(() {
      _selectedSpecialty = name;
      _searchController.text = name;
    });
    _searchDoctors(name);
  }

  void _clearSpecialty() {
    setState(() {
      _selectedSpecialty = null;
    });
    _searchDoctors(_searchController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Doctors'),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search for specialty, doctor..',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: const Text('All'),
                      selected: _selectedSpecialty == null,
                      onSelected: (_) => _clearSpecialty(),
                    ),
                  ),
                  ...Specialty.specialties.map(
                        (spec) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(spec.name),
                        selected: _selectedSpecialty == spec.name,
                        onSelected: (_) => _selectSpecialty(spec.name),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _buildResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResults() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(child: Text(_error!));
    }
    if (_doctors.isEmpty) {
      return const Center(child: Text('No doctors found.'));
    }
    return ListView.separated(
      itemCount: _doctors.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return ApiDoctorItem(doctor: _doctors[index]);
      },
    );
  }
}
