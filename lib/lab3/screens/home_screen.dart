import 'package:flutter/material.dart';
import '../main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/medical_cubit.dart';
import '../cubit/medical_state.dart';
import '../models/medical_data.dart';
import 'appointment_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicalCubit, MedicalState>(
      builder: (context, state) {
        if (state is MedicalLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is MedicalError) {
          return Scaffold(body: Center(child: Text(state.message)));
        }
        final doctors = state is MedicalSuccess ? state.visibleDoctors : <Doctor>[];
        final favorites = state is MedicalSuccess ? state.favoriteIds :
          state is MedicalEmpty ? state.favoriteIds : <String>{};
        return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
              children: [
                _topRow(),
                const SizedBox(height: 22),
                _searchBar(context),
                const SizedBox(height: 18),

                // SINGURA functionalitate:
                // apasarea pe cardul Appointment deschide pagina Appointment.
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AppointmentScreen(),
                      ),
                    );
                  },
                  child: _appointmentCard(),
                ),

                const SizedBox(height: 28),
                _sectionTitle('Health Services'),
                const SizedBox(height: 14),
                _services(),
                const SizedBox(height: 26),
                _sectionTitle('Nearby Doctor'),
                const SizedBox(height: 16),
                if (state is MedicalEmpty)
                  const Text('No doctors found')
                else
                  ...doctors.asMap().entries.map((entry) => Padding(
                    padding: EdgeInsets.only(bottom: entry.key == doctors.length - 1 ? 0 : 18),
                    child: _doctor(
                      image: entry.value.id == 'doctor-001'
                          ? 'assets/photos/dr-emmly.png'
                          : 'assets/photos/dr-sonja.png',
                      name: entry.value.name,
                      speciality: entry.value.specialty,
                      address: entry.value.distance,
                      favorite: favorites.contains(entry.value.id),
                      onFavorite: () => context.read<MedicalCubit>().toggleFavorite(entry.value.id),
                    ),
                  )),
              ],
            ),
          ),
        ),
      ),
    );
      },
    );
  }

  Widget _topRow() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/photos/jonathan.png'),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Jonathan',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'May you always be healthy',
                style: TextStyle(
                  fontSize: 9,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.notifications_none_rounded,
              size: 22,
              color: AppColors.dark,
            ),
            Positioned(
              right: 1,
              top: 1,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _searchBar(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(children: [
        const Icon(Icons.search_rounded, color: Color(0xFFB7C0D1), size: 22),
        const SizedBox(width: 12),
        Expanded(child: TextField(
          onChanged: context.read<MedicalCubit>().search,
          style: const TextStyle(fontSize: 11, color: AppColors.dark),
          decoration: const InputDecoration(
            hintText: 'Search something',
            hintStyle: TextStyle(fontSize: 11, color: Color(0xFFB7C0D1)),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
        )),
        IconButton(
          onPressed: () => context.read<MedicalCubit>().toggleSort(),
          icon: const Icon(Icons.tune_rounded, color: Color(0xFFB7C0D1), size: 21),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ]),
    );
  }

  Widget _appointmentCard() {
    return SizedBox(
      height: 174,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 145,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
            decoration: BoxDecoration(
              color: AppColors.teal,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Appointment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white,
                      size: 21,
                    ),
                  ],
                ),
                SizedBox(height: 17),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 17,
                      color: Colors.white,
                    ),
                    SizedBox(width: 9),
                    Text(
                      '22 October, 2023',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 17,
                      color: Colors.white,
                    ),
                    SizedBox(width: 9),
                    Text(
                      '08.00 AM - 10.30 AM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            right: 17,
            top: 63,
            child: Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.edit_outlined,
                color: AppColors.teal,
                size: 20,
              ),
            ),
          ),

          Positioned(
            left: 30,
            right: 18,
            bottom: 0,
            child: Container(
              height: 61,
              padding: const EdgeInsets.symmetric(horizontal: 11),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/photos/dr-richar.png',
                      width: 38,
                      height: 38,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 11),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Richar Kandowen',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.dark,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Child Specialist',
                          style: TextStyle(
                            fontSize: 9,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 20,
                    color: Color(0xFF5F6B7A),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.dark,
            ),
          ),
        ),
        const Text(
          'See All',
          style: TextStyle(
            fontSize: 9,
            color: AppColors.teal,
          ),
        ),
      ],
    );
  }

  Widget _services() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _Service(icon: 'assets/photos/tooth.png', label: 'Tooth'),
        _Service(icon: 'assets/photos/eye.png', label: 'Eye'),
        _Service(icon: 'assets/photos/lungs.png', label: 'Lungs'),
        _Service(icon: 'assets/photos/ear.png', label: 'Ear'),
      ],
    );
  }

  Widget _doctor({
    required String image,
    required String name,
    required String speciality,
    required String address,
    required bool favorite,
    required VoidCallback onFavorite,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                speciality,
                style: const TextStyle(
                  fontSize: 9,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 12,
                    color: AppColors.teal,
                  ),
                  const SizedBox(width: 3),
                  Expanded(
                    child: Text(
                      address,
                      style: const TextStyle(
                        fontSize: 8.5,
                        color: AppColors.dark,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onFavorite,
          child: Icon(
            favorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            size: 20,
            color: favorite ? Colors.redAccent : const Color(0xFFAEB7C2),
          ),
        ),
      ],
    );
  }
}

class _Service extends StatelessWidget {
  final String icon;
  final String label;

  const _Service({
    required this.icon,
    required this.label,
  });

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
          child: Image.asset(
            icon,
            width: 46,
            height: 46,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF7E8794),
          ),
        ),
      ],
    );
  }
}
