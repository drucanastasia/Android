import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/medical_cubit.dart';
import '../main.dart';
import '../models/medical_data.dart';

class DoctorRow extends StatelessWidget {
  final Doctor doctor;
  final bool favorite;

  const DoctorRow({
    super.key,
    required this.doctor,
    required this.favorite,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.lightGrey,
          backgroundImage:
              doctor.avatarUrl.isEmpty ? null : NetworkImage(doctor.avatarUrl),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                doctor.specialty,
                style: const TextStyle(fontSize: 9, color: AppColors.grey),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 12, color: AppColors.teal),
                  const SizedBox(width: 3),
                  Expanded(
                    child: Text(
                      doctor.distance,
                      style: const TextStyle(fontSize: 8.5, color: AppColors.dark),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () =>
              context.read<MedicalCubit>().toggleFavorite(doctor.id),
          icon: Icon(
            favorite
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            size: 20,
            color: favorite ? AppColors.teal : const Color(0xFFAEB7C2),
          ),
        ),
      ],
    );
  }
}
