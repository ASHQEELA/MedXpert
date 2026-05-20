import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../communication/ChatScreen.dart';

class ConsultDoctorScreen extends StatelessWidget {
  const ConsultDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      {
        "name": "Dr. Sarah Ahmed",
        "specialization": "Cardiologist",
        "phone": "+8801700000001",
        "rating": "4.8",
        "reviews": "120"
      },
      {
        "name": "Dr. Rahman Hossain",
        "specialization": "Neurologist",
        "phone": "+8801700000002",
        "rating": "4.9",
        "reviews": "98"
      },
      {
        "name": "Dr. Nusrat Jahan",
        "specialization": "Dermatologist",
        "phone": "+8801700000003",
        "rating": "4.7",
        "reviews": "210"
      },
      {
        "name": "Dr. Tanvir Islam",
        "specialization": "Orthopedic",
        "phone": "+8801700000004",
        "rating": "4.6",
        "reviews": "105"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme:
            const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Available Doctors",
          style: TextStyle(
            color: Colors.black,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding:
            const EdgeInsets.all(
                20),
        itemCount:
            doctors.length,
        separatorBuilder:
            (context, index) =>
                const SizedBox(
                    height: 16),
        itemBuilder:
            (context, index) {
          final doctor =
              doctors[index];

          return _modernDoctorCard(
            context,
            name:
                doctor["name"]!,
            specialization:
                doctor[
                    "specialization"]!,
            phone:
                doctor["phone"]!,
            rating:
                doctor["rating"]!,
            reviews:
                doctor["reviews"]!,
          );
        },
      ),
    );
  }

  Widget _modernDoctorCard(
    BuildContext context, {
    required String name,
    required String
        specialization,
    required String phone,
    required String rating,
    required String reviews,
  }) {
    return Container(
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius
                .circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey
                .withOpacity(
                    0.08),
            blurRadius: 15,
            offset:
                const Offset(
                    0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets
                    .all(16),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration:
                          BoxDecoration(
                        color: const Color(
                                0xFF1DA1F2)
                            .withOpacity(
                                0.1),
                        borderRadius:
                            BorderRadius
                                .circular(
                                    18),
                      ),
                      child:
                          const Icon(
                        Icons.person,
                        size: 40,
                        color: Color(
                            0xFF1DA1F2),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child:
                          Container(
                        height: 14,
                        width: 14,
                        decoration:
                            BoxDecoration(
                          color: Colors
                              .green,
                          shape: BoxShape
                              .circle,
                          border:
                              Border.all(
                            color: Colors
                                .white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          Expanded(
                            child:
                                Text(
                              name,
                              style:
                                  const TextStyle(
                                fontSize:
                                    17,
                                fontWeight:
                                    FontWeight
                                        .bold,
                                color:
                                    Colors.black87,
                              ),
                              overflow:
                                  TextOverflow
                                      .ellipsis,
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal:
                                  8,
                              vertical:
                                  4,
                            ),
                            decoration:
                                BoxDecoration(
                              color: Colors
                                  .orange
                                  .withOpacity(
                                      0.1),
                              borderRadius:
                                  BorderRadius.circular(
                                      8),
                            ),
                            child:
                                Row(
                              children: [
                                const Icon(
                                  Icons
                                      .star,
                                  color: Colors
                                      .orange,
                                  size:
                                      14,
                                ),
                                const SizedBox(
                                    width:
                                        4),
                                Text(
                                  rating,
                                  style:
                                      const TextStyle(
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                    fontSize:
                                        12,
                                    color:
                                        Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height:
                              6),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal:
                              10,
                          vertical:
                              4,
                        ),
                        decoration:
                            BoxDecoration(
                          color: const Color(
                                  0xFF1DA1F2)
                              .withOpacity(
                                  0.08),
                          borderRadius:
                              BorderRadius.circular(
                                  6),
                        ),
                        child: Text(
                          specialization,
                          style:
                              const TextStyle(
                            color: Color(
                                0xFF1DA1F2),
                            fontWeight:
                                FontWeight
                                    .w600,
                            fontSize:
                                12,
                          ),
                        ),
                      ),
                      const SizedBox(
                          height:
                              8),
                      Text(
                        "$reviews Reviews",
                        style:
                            TextStyle(
                          color: Colors
                              .grey
                              .shade400,
                          fontSize:
                              12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors
                .grey.shade100,
            height: 1,
          ),
          Padding(
            padding:
                const EdgeInsets
                    .all(12),
            child: Row(
              children: [
                Expanded(
                  child:
                      OutlinedButton
                          .icon(
                    onPressed:
                        () async {
                      final uri =
                          Uri.parse(
                        "tel:$phone",
                      );

                      if (await canLaunchUrl(
                          uri)) {
                        await launchUrl(
                            uri);
                      }
                    },
                    style:
                        OutlinedButton.styleFrom(
                      padding:
                          const EdgeInsets.symmetric(
                        vertical:
                            12,
                      ),
                      side:
                          const BorderSide(
                        color: Colors
                            .green,
                      ),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                12),
                      ),
                    ),
                    icon:
                        const Icon(
                      Icons.call,
                      size: 18,
                      color: Colors
                          .green,
                    ),
                    label:
                        const Text(
                      "Voice Call",
                      style:
                          TextStyle(
                        color: Colors
                            .green,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                    width: 12),
                Expanded(
                  child:
                      ElevatedButton
                          .icon(
                    onPressed:
                        () {
                      Navigator
                          .push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) =>
                                  const ChatScreen(),
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(
                        0xFF1DA1F2,
                      ),
                      foregroundColor:
                          Colors.white,
                      padding:
                          const EdgeInsets.symmetric(
                        vertical:
                            12,
                      ),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                12),
                      ),
                      elevation:
                          0,
                    ),
                    icon:
                        const Icon(
                      Icons
                          .chat_bubble_outline,
                      size: 18,
                    ),
                    label:
                        const Text(
                      "Chat Now",
                      style:
                          TextStyle(
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
