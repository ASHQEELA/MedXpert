import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({super.key});

  @override
  State<AmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Stack(
        children: [
          const _SimulatedMapBackground(),

          Center(
            child: _PulsingMarker(controller: _controller),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: _DraggableAmbulanceSheet(),
          ),
        ],
      ),
    );
  }
}


class _DraggableAmbulanceSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 25,
            spreadRadius: 5,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nearest Ambulance",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Arriving in 5 min",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.emergency, color: Colors.red.shade400),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.blue.shade100,
                        child: const Icon(Icons.person, color: Colors.blue),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Medi-Van Express",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Toyota HiAce • ICU Equipped",
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.star, size: 14, color: Colors.amber),
                            SizedBox(width: 4),
                            Text("4.8", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _AmbulanceTypeCard(
                        title: "Basic Life Support",
                        price: "\$50",
                        isSelected: false,
                      ),
                      const SizedBox(width: 12),
                      _AmbulanceTypeCard(
                        title: "ICU Ambulance",
                        price: "\$120",
                        isSelected: true,
                      ),
                      const SizedBox(width: 12),
                      _AmbulanceTypeCard(
                        title: "Air Ambulance",
                        price: "\$2500",
                        isSelected: false,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [Colors.redAccent.shade200, Colors.red.shade700],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () async {
                        final Uri launchUri = Uri(scheme: 'tel', path: '999');
                        if (await canLaunchUrl(launchUri)) {
                          await launchUrl(launchUri);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.call, color: Colors.white),
                          SizedBox(width: 12),
                          Text(
                            "CONFIRM AMBULANCE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AmbulanceTypeCard extends StatelessWidget {
  final String title;
  final String price;
  final bool isSelected;

  const _AmbulanceTypeCard({
    required this.title,
    required this.price,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.red : Colors.grey.shade200,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: isSelected ? Colors.red.shade700 : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: isSelected ? Colors.red.shade700 : Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}

class _PulsingMarker extends StatelessWidget {
  final AnimationController controller;

  const _PulsingMarker({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 150 * controller.value,
              height: 150 * controller.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent.withOpacity(0.3 * (1 - controller.value)),
              ),
            ),
            Container(
              width: 100 * controller.value,
              height: 100 * controller.value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent.withOpacity(0.5 * (1 - controller.value)),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SimulatedMapBackground extends StatelessWidget {
  const _SimulatedMapBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F5F8), 
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(top: 150, left: 0, right: 0, child: Container(height: 15, color: Colors.white)),
          Positioned(top: 156, left: 0, right: 0, child: Divider(color: Colors.grey.shade300, thickness: 1)),

          Positioned(left: 120, top: 0, bottom: 0, child: Container(width: 15, color: Colors.white)),
          Positioned(left: 127, top: 0, bottom: 0, child: VerticalDivider(color: Colors.grey.shade300, thickness: 1)),

          Positioned(top: 50, left: 20, child: _MapBuilding(width: 60, height: 60)),
          Positioned(top: 200, right: 40, child: _MapBuilding(width: 80, height: 120)),
          Positioned(bottom: 300, left: 50, child: _MapBuilding(width: 100, height: 80)),
        ],
      ),
    );
  }
}

class _MapBuilding extends StatelessWidget {
  final double width;
  final double height;

  const _MapBuilding({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
