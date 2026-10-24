import '../models/medical_data.dart';

abstract class MedicalState {
  const MedicalState();
}

class MedicalLoading extends MedicalState {
  const MedicalLoading();
}

class MedicalSuccess extends MedicalState {
  final MedicalData data;
  final List<Doctor> visibleDoctors;
  final Set<String> favoriteIds;
  final String query;
  final bool sortAscending;

  const MedicalSuccess({
    required this.data,
    required this.visibleDoctors,
    required this.favoriteIds,
    required this.query,
    required this.sortAscending,
  });
}

class MedicalEmpty extends MedicalState {
  final MedicalData data;
  final Set<String> favoriteIds;
  final String query;
  final bool sortAscending;

  const MedicalEmpty({
    required this.data,
    required this.favoriteIds,
    required this.query,
    required this.sortAscending,
  });
}

class MedicalError extends MedicalState {
  final String message;
  const MedicalError(this.message);
}
