import 'package:flutter/material.dart';
import 'PharmacyCart.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Define data cleanly (Name + Price)
    final List<Map<String, String>> medicines = [
      {"name": "Paracetamol", "price": "\$5.00", "desc": "Fever & Pain relief"},
      {"name": "Antibiotics", "price": "\$12.50", "desc": "Prescription only"},
      {"name": "Pain Killers", "price": "\$8.00", "desc": "General pain relief"},
      {"name": "Insulin", "price": "\$25.00", "desc": "Diabetes care"},
      {"name": "First Aid Kit", "price": "\$30.00", "desc": "Emergency essentials"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text("Emergency Pharmacy"),
        backgroundColor: const Color(0xFF1DA1F2),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: medicines.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = medicines[index];
          return _medicineTile(
            context,
            name: item["name"]!,
            price: item["price"]!,
            description: item["desc"]!,
          );
        },
      ),
    );
  }

  Widget _medicineTile(
      BuildContext context, {
        required String name,
        required String price,
        required String description,
      }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF1DA1F2).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.medication_outlined,
            color: Color(0xFF1DA1F2),
            size: 28,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(description, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1DA1F2),
            foregroundColor: Colors.white, // Forces white text
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // Passing the name so the Cart knows what we bought
                builder: (_) => PharmacyCartScreen(itemName: name, itemPrice: price),
              ),
            );
          },
          child: const Text("Add"),
        ),
      ),
    );
  }
}