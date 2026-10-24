import 'package:flutter/material.dart';
import 'fitness_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const green = Color(0xFF20C765);
  static const dark = Color(0xFF111116);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // STATUS BAR - ORA, WIFI, BATERIE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '9:41',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      // Semnal
                      SizedBox(
                        width: 18,
                        height: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(width: 3, height: 4, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(1))),
                            const SizedBox(width: 1.5),
                            Container(width: 3, height: 6, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(1))),
                            const SizedBox(width: 1.5),
                            Container(width: 3, height: 9, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(1))),
                            const SizedBox(width: 1.5),
                            Container(width: 3, height: 12, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(1))),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      // WiFi
                      const Icon(Icons.wifi, size: 16, color: Colors.black),
                      const SizedBox(width: 6),
                      // Baterie
                      Row(
                        children: [
                          Container(
                            width: 22,
                            height: 11,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(2),
                                        bottomLeft: Radius.circular(2),
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(flex: 2, child: SizedBox()),
                              ],
                            ),
                          ),
                          Container(
                            width: 2,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Text(
                'Friday, 20 May',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8C8C96),
                ),
              ),

              const SizedBox(height: 5),

              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Good Morning',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFE2E2E5),
                      ),
                    ),
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      size: 22,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // TODAY'S CHALLENGE
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: dark,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today's Challenge",
                            style: TextStyle(
                              color: Color(0xFF9D9DA6),
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'Running',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 47,
                      height: 47,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const CircularProgressIndicator(
                            value: 0.75,
                            strokeWidth: 4,
                            backgroundColor: Color(0xFF33333A),
                            valueColor:
                            AlwaysStoppedAnimation<Color>(green),
                          ),
                          const Text(
                            '15/20',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 23),

              // FEATURED PLAN
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Featured Plan',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: green,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 130,
                child: Row(
                  children: [

                    Expanded(
                      child: _featuredCard(
                        image: 'assets/images/1.jpg',
                        title: 'Massive Upper Body',
                        subtitle: '5 week  •  4x/week',
                        context: context,
                      ),
                    ),

                    const SizedBox(width: 14),

                    SizedBox(
                      width: 270,
                      child: _featuredCard(
                        image: 'assets/images/1.jpg',
                        title: 'Muscle Building',
                        subtitle: '6 week  •  4x/week',
                        context: context,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // WORKOUT PROGRAMS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Workout Programs',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: green,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // FILTERS
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _filterButton('All Type', true),
                    _filterButton('Pilates', false),
                    _filterButton('Cardio', false),
                    _filterButton('Boxing', false),
                    _filterButton('Yoga', false),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // WORKOUT CARDS
              Row(
                children: [

                  Expanded(
                    child: _workoutCard(
                      image: 'assets/images/2.jpg',
                      title: 'Yoga',
                      calories: '210 kcal',
                      time: '120 min',
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _workoutCard(
                      image: 'assets/images/3.jpg',
                      title: 'Arm\nStrengthening',
                      calories: '210 kcal',
                      time: '120 min',
                      pro: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featuredCard({
    required String image,
    required String title,
    required String subtitle,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const FitnessPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.28),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 7),

              Row(
                children: [
                  const Icon(
                    Icons.fitness_center,
                    size: 13,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'Start Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filterButton(String text, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 9),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: selected ? green : Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: selected ? green : const Color(0xFFE0E0E4),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : const Color(0xFF8B8B94),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _workoutCard({
    required String image,
    required String title,
    required String calories,
    required String time,
    bool pro = false,
  }) {
    return Container(
      height: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.28),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        children: [

          if (pro)
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.workspace_premium,
                      size: 11,
                      color: green,
                    ),
                    SizedBox(width: 3),
                    Text(
                      'Pro',
                      style: TextStyle(
                        color: green,
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          Positioned(
            left: 12,
            bottom: 13,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 7),

                Row(
                  children: [
                    const Icon(
                      Icons.local_fire_department_outlined,
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      calories,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                      ),
                    ),

                    const SizedBox(width: 10),

                    const Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 11,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}