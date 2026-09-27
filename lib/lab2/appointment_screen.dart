import 'package:flutter/material.dart';
import 'main.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(22, 17, 22, 28),
              children: [
                _header(context),
                const SizedBox(height: 23),
                _doctorInfo(),
                const SizedBox(height: 28),

                const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.dark,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Worem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Nunc vulputate libero et velit interdum, ac aliquet odio '
                  'mattis. Class aptent taciti sociosqu ad litora torquent per '
                  'conubia nostra, per inceptos himenaeos. Curabitur tempus '
                  'urna at turpis condimentum lobortis. Ut commodo efficitur '
                  'neque. Ut diam quam, semper iaculis condimentum ac, '
                  'vestibulum eu nisl.',
                  style: TextStyle(
                    fontSize: 10,
                    height: 1.35,
                    color: AppColors.grey,
                  ),
                ),

                const SizedBox(height: 42),
                _sectionTitle('Working Hours'),
                const SizedBox(height: 15),
                _staticOptions(
                  const ['10.00 AM', '11.00 AM', '12.00 PM'],
                  activeIndex: 1,
                ),

                const SizedBox(height: 24),
                _sectionTitle('Date'),
                const SizedBox(height: 15),
                _staticOptions(
                  const ['Sun 4', 'Mon 5', 'Tue 6'],
                  activeIndex: 0,
                ),

                const SizedBox(height: 72),

                Container(
                  height: 54,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.teal,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Text(
                    'Book an Appointment',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 21,
                color: AppColors.dark,
              ),
            ),
          ),
          const Text(
            'Appointment',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.teal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _doctorInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Image.asset(
            'assets/photos/dr-upul.png',
            width: 96,
            height: 96,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 17),
        Expanded(
          child: SizedBox(
            height: 96,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Dr.Upul',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.dark,
                        ),
                      ),
                    ),
                    _ContactIcon(Icons.chat_bubble_outline_rounded),
                    SizedBox(width: 9),
                    _ContactIcon(Icons.phone_outlined),
                    SizedBox(width: 9),
                    _ContactIcon(Icons.videocam_outlined),
                  ],
                ),
                const SizedBox(height: 3),
                const Text(
                  'Denteeth',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF61C6B9),
                  ),
                ),
                const Spacer(),
                const Row(
                  children: [
                    Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.dark,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\$120.00',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF61C6B9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.dark,
            ),
          ),
        ),
        const Text(
          'See All',
          style: TextStyle(
            fontSize: 11,
            color: AppColors.dark,
          ),
        ),
      ],
    );
  }

  Widget _staticOptions(
    List<String> labels, {
    required int activeIndex,
  }) {
    return Row(
      children: List.generate(labels.length, (index) {
        final active = index == activeIndex;

        return Expanded(
          child: Container(
            height: 43,
            margin: EdgeInsets.only(
              right: index < labels.length - 1 ? 10 : 0,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: active ? AppColors.teal : const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              labels[index],
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: active ? Colors.white : AppColors.dark,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _ContactIcon extends StatelessWidget {
  final IconData icon;

  const _ContactIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 23,
      height: 23,
      decoration: const BoxDecoration(
        color: AppColors.iconBg,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 13,
        color: Color(0xFF264A4A),
      ),
    );
  }
}
