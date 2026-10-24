import 'package:flutter/material.dart';
import '../main.dart';
import '../models/medical_data.dart';

class ServiceItem extends StatelessWidget {
  final HealthService service;

  const ServiceItem({super.key, required this.service});

  IconData get icon {
    switch (service.id) {
      case 'tooth':
        return Icons.medical_services_outlined;
      case 'eye':
        return Icons.visibility_outlined;
      case 'lungs':
        return Icons.air;
      case 'ear':
        return Icons.hearing_outlined;
      default:
        return Icons.health_and_safety_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 54,
          height: 54,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 27, color: AppColors.teal),
        ),
        const SizedBox(height: 7),
        Text(
          service.name,
          style: const TextStyle(fontSize: 10, color: Color(0xFF7E8794)),
        ),
      ],
    );
  }
}
