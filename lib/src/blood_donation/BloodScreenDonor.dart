import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodDonorsScreen extends StatelessWidget {
  final String bloodGroup;

  const BloodDonorsScreen({super.key, required this.bloodGroup});

  @override
  Widget build(BuildContext context) {
    final donors = [
      {
        "name": "Rahim Uddin",
        "phone": "+8801712345678",
        "location": "Dhaka",
      },
      {
        "name": "Karim Ahmed",
        "phone": "+8801812345679",
        "location": "Mirpur",
      },
      {
        "name": "Nusrat Jahan",
        "phone": "+8801912345680",
        "location": "Dhanmondi",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: AppBar(
        title: Text("Available $bloodGroup Donors"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: donors.length,
        itemBuilder: (context, index) {
          final donor = donors[index];
          return _donorCard(
            name: donor["name"]!,
            phone: donor["phone"]!,
            location: donor["location"]!,
          );
        },
      ),
    );
  }

  Widget _donorCard({
    required String name,
    required String phone,
    required String location,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Avatar
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.red.withOpacity(0.1),
            child: const Icon(
              Icons.person,
              color: Colors.red,
              size: 32,
            ),
          ),

          const SizedBox(width: 16),

          /// Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "📍 $location",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 6),
                Text(
                  phone,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),

          /// Call Button
          IconButton(
            icon: const Icon(Icons.call, color: Colors.green),
            onPressed: () async {
              final uri = Uri.parse("tel:$phone");
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
          ),
        ],
      ),
    );
  }
}
