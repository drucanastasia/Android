import 'package:flutter/material.dart';

class FitnessPage extends StatelessWidget {
  const FitnessPage({super.key});

  static const green = Color(0xFF20C765);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // POZA MARE CU STATUS BAR PESTE EA
                  SizedBox(
                    height: 315,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        // IMAGINEA
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/4.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),

                        // ==========================================
                        // STATUS BAR - PESTE IMAGINE (ALB)
                        // Exact ca în screenshot-ul tău
                        // ==========================================
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 12,
                              left: 24,
                              right: 24,
                              bottom: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ORA
                                const Text(
                                  '9:41',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                // ICONIȚE DREAPTA
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
                                          Container(width: 3, height: 4, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(1))),
                                          const SizedBox(width: 1.5),
                                          Container(width: 3, height: 6, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(1))),
                                          const SizedBox(width: 1.5),
                                          Container(width: 3, height: 9, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(1))),
                                          const SizedBox(width: 1.5),
                                          Container(width: 3, height: 12, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(1))),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    // WiFi
                                    const Icon(Icons.wifi, size: 16, color: Colors.white),
                                    const SizedBox(width: 6),
                                    // Baterie
                                    Row(
                                      children: [
                                        Container(
                                          width: 22,
                                          height: 11,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white, width: 1),
                                            borderRadius: BorderRadius.circular(3),
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 8,
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
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
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // BUTON BACK (sub status bar)
                        Positioned(
                          top: 35,
                          left: 16,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 43,
                              height: 43,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.55),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        // BUTON MORE (sub status bar)
                        const Positioned(
                          top: 35,
                          right: 17,
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 20, 22, 130),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // RATING
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFFFB52E),
                              size: 17,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              '4.5',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(1,232 reviews)',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 11),

                        const Text(
                          'Mid City Gym Training',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 9),

                        Text(
                          'California, New York',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Container(
                          height: 1,
                          color: const Color(0xFFE5E5E5),
                        ),

                        const SizedBox(height: 18),

                        Text(
                          'Lorem ipsum dolor sit amet consectetur. Blandit '
                              'vitae aliquet eros laoreet quam sollicitudin. Duis non '
                              'eu habitant id velies eget amet tellus...',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13,
                            height: 1.55,
                          ),
                        ),

                        const SizedBox(height: 2),

                        const Text(
                          'Read more',
                          style: TextStyle(
                            color: green,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Amenities',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 14),

                        Row(
                          children: [
                            Expanded(
                              child: _amenity(
                                Icons.shower_outlined,
                                'Showers',
                              ),
                            ),
                            const SizedBox(width: 13),
                            Expanded(
                              child: _amenity(
                                Icons.inventory_2_outlined,
                                'Lockers',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 11),

                        Row(
                          children: [
                            Expanded(
                              child: _amenity(
                                Icons.local_parking_outlined,
                                'Parking',
                              ),
                            ),
                            const SizedBox(width: 13),
                            Expanded(
                              child: _amenity(
                                Icons.wifi,
                                'Free Wi-Fi',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // BOTTOM BAR
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(22, 15, 22, 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '\$69.00',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: ' /week',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF8D8D95),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: green,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Reserve',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _amenity(IconData icon, String title) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F8),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE1E1E5),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 13),
          Icon(
            icon,
            size: 20,
            color: const Color(0xFF8B8B94),
          ),
          const SizedBox(width: 9),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF85858E),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}