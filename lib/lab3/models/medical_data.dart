class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String distance;
  final String avatarUrl;
  final bool isFavorite;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.distance,
    required this.avatarUrl,
    required this.isFavorite,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      specialty: json['specialty'] ?? '',
      distance: json['distance'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}

class HealthService {
  final String id;
  final String name;

  const HealthService({required this.id, required this.name});

  factory HealthService.fromJson(Map<String, dynamic> json) {
    return HealthService(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class HomeData {
  final String greeting;
  final String subtitle;
  final String avatarUrl;
  final String searchHint;
  final String appointmentTitle;
  final String appointmentDate;
  final String appointmentTime;
  final String appointmentDoctorName;
  final String appointmentDoctorSpecialty;
  final String appointmentDoctorAvatar;
  final List<HealthService> services;
  final List<Doctor> doctors;

  const HomeData({
    required this.greeting,
    required this.subtitle,
    required this.avatarUrl,
    required this.searchHint,
    required this.appointmentTitle,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.appointmentDoctorName,
    required this.appointmentDoctorSpecialty,
    required this.appointmentDoctorAvatar,
    required this.services,
    required this.doctors,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    final user = json['user'] as Map<String, dynamic>;
    final appointment = json['appointment'] as Map<String, dynamic>;
    final doctor = appointment['doctor'] as Map<String, dynamic>;

    return HomeData(
      greeting: user['greeting'] ?? '',
      subtitle: user['subtitle'] ?? '',
      avatarUrl: user['avatarUrl'] ?? '',
      searchHint: json['search']['hint'] ?? '',
      appointmentTitle: appointment['title'] ?? '',
      appointmentDate: appointment['date'] ?? '',
      appointmentTime: appointment['time'] ?? '',
      appointmentDoctorName: doctor['name'] ?? '',
      appointmentDoctorSpecialty: doctor['specialty'] ?? '',
      appointmentDoctorAvatar: doctor['avatarUrl'] ?? '',
      services: (json['healthServices'] as List)
          .map((e) => HealthService.fromJson(e))
          .toList(),
      doctors: (json['nearbyDoctors'] as List)
          .map((e) => Doctor.fromJson(e))
          .toList(),
    );
  }
}

class AppointmentData {
  final String title;
  final String doctorName;
  final String clinic;
  final String avatarUrl;
  final String payment;
  final String detailsTitle;
  final String description;
  final String workingHoursTitle;
  final List<Map<String, dynamic>> hours;
  final String dateTitle;
  final List<Map<String, dynamic>> dates;
  final String bookLabel;

  const AppointmentData({
    required this.title,
    required this.doctorName,
    required this.clinic,
    required this.avatarUrl,
    required this.payment,
    required this.detailsTitle,
    required this.description,
    required this.workingHoursTitle,
    required this.hours,
    required this.dateTitle,
    required this.dates,
    required this.bookLabel,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    return AppointmentData(
      title: json['title'] ?? '',
      doctorName: json['doctor']['name'] ?? '',
      clinic: json['doctor']['clinic'] ?? '',
      avatarUrl: json['doctor']['avatarUrl'] ?? '',
      payment: json['payment']['formatted'] ?? '',
      detailsTitle: json['details']['title'] ?? '',
      description: json['details']['description'] ?? '',
      workingHoursTitle: json['workingHours']['title'] ?? '',
      hours: List<Map<String, dynamic>>.from(json['workingHours']['slots']),
      dateTitle: json['date']['title'] ?? '',
      dates: List<Map<String, dynamic>>.from(json['date']['slots']),
      bookLabel: json['actions']['bookAppointment']['label'] ?? '',
    );
  }
}

class MedicalData {
  final HomeData home;
  final AppointmentData appointment;

  const MedicalData({required this.home, required this.appointment});

  factory MedicalData.fromJson(Map<String, dynamic> json) {
    return MedicalData(
      home: HomeData.fromJson(json['homeScreen']),
      appointment: AppointmentData.fromJson(json['appointmentDetails']),
    );
  }
}
