import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/medical_data.dart';
import 'medical_state.dart';

class MedicalCubit extends Cubit<MedicalState> {
  MedicalCubit() : super(const MedicalLoading());

  MedicalData? _data;
  String _query = '';
  bool _sortAscending = true;
  final Set<String> _favoriteIds = {};

  Future<void> loadData() async {
    emit(const MedicalLoading());

    try {
      // Încărcare asincronă din JSON inclus în proiect.
      await Future.delayed(const Duration(milliseconds: 500));
      final text = await rootBundle.loadString('assets/data/lab_v2.json');
      final map = jsonDecode(text) as Map<String, dynamic>;
      _data = MedicalData.fromJson(map);

      for (final doctor in _data!.home.doctors) {
        if (doctor.isFavorite) {
          _favoriteIds.add(doctor.id);
        }
      }

      _emitFiltered();
    } catch (e) {
      emit(MedicalError('Nu s-au putut încărca datele: $e'));
    }
  }

  void search(String value) {
    _query = value.trim().toLowerCase();
    _emitFiltered();
  }

  void toggleSort() {
    _sortAscending = !_sortAscending;
    _emitFiltered();
  }

  void toggleFavorite(String doctorId) {
    if (_favoriteIds.contains(doctorId)) {
      _favoriteIds.remove(doctorId);
    } else {
      _favoriteIds.add(doctorId);
    }
    _emitFiltered();
  }

  void _emitFiltered() {
    final data = _data;
    if (data == null) return;

    final doctors = data.home.doctors.where((doctor) {
      return doctor.name.toLowerCase().contains(_query) ||
          doctor.specialty.toLowerCase().contains(_query) ||
          doctor.distance.toLowerCase().contains(_query);
    }).toList();

    doctors.sort((a, b) => _sortAscending
        ? a.name.compareTo(b.name)
        : b.name.compareTo(a.name));

    if (doctors.isEmpty) {
      emit(MedicalEmpty(
        data: data,
        favoriteIds: Set.of(_favoriteIds),
        query: _query,
        sortAscending: _sortAscending,
      ));
    } else {
      emit(MedicalSuccess(
        data: data,
        visibleDoctors: doctors,
        favoriteIds: Set.of(_favoriteIds),
        query: _query,
        sortAscending: _sortAscending,
      ));
    }
  }
}
