import 'package:flutter/material.dart';

class PharmacyCartScreen extends StatefulWidget {
  final String itemName;
  final String itemPrice;

  const PharmacyCartScreen({
    super.key,
    required this.itemName,
    required this.itemPrice,
  });

  @override
  State<PharmacyCartScreen> createState() =>
      _PharmacyCartScreenState();
}

class _PharmacyCartScreenState
    extends State<PharmacyCartScreen> {
  int quantity = 1;
  double pricePerItem = 0.0;

  @override
  void initState() {
    super.initState();
    String cleanPrice =
        widget.itemPrice.replaceAll(
      RegExp(r'[^0-9.]'),
      '',
    );

    pricePerItem =
        double.tryParse(cleanPrice) ??
            0.0;
  }

  double get totalPrice =>
      quantity * pricePerItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white,
      appBar: AppBar(
        title:
            const Text("Your Cart"),
        backgroundColor:
            const Color(
          0xFF1DA1F2,
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                quantity = 0;
              });

              Navigator.pop(
                  context);
            },
            child: const Text(
              "Clear Cart",
              style: TextStyle(
                color:
                    Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(
                16),
        child: Column(
          children: [
            if (quantity > 0)
              Row(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration:
                        BoxDecoration(
                      color: const Color(
                              0xFF1DA1F2)
                          .withOpacity(
                              0.1),
                      borderRadius:
                          BorderRadius
                              .circular(
                                  12),
                      border:
                          Border.all(
                        color: Colors
                            .grey
                            .shade300,
                      ),
                    ),
                    child:
                        const Icon(
                      Icons
                          .medication,
                      color: Color(
                          0xFF1DA1F2),
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                      width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          widget
                              .itemName,
                          style:
                              const TextStyle(
                            fontSize:
                                16,
                            fontWeight:
                                FontWeight
                                    .w600,
                          ),
                        ),
                        const SizedBox(
                            height:
                                4),
                        Text(
                          widget
                              .itemPrice,
                          style:
                              const TextStyle(
                            color: Colors
                                .grey,
                          ),
                        ),
                        const SizedBox(
                            height:
                                8),
                        Row(
                          children: [
                            _qtyButton(
                              Icons
                                  .remove,
                              () {
                                if (quantity >
                                    1) {
                                  setState(
                                    () =>
                                        quantity--,
                                  );
                                }
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal:
                                    12,
                              ),
                              child:
                                  Text(
                                quantity
                                    .toString(),
                                style:
                                    const TextStyle(
                                  fontSize:
                                      16,
                                ),
                              ),
                            ),
                            _qtyButton(
                              Icons
                                  .add,
                              () {
                                setState(
                                  () =>
                                      quantity++,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .end,
                    children: [
                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style:
                            const TextStyle(
                          fontSize:
                              16,
                          fontWeight:
                              FontWeight
                                  .w600,
                        ),
                      ),
                      const SizedBox(
                          height:
                              12),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () =>
                                quantity =
                                    0,
                          );
                        },
                        child:
                            const Text(
                          "Remove",
                          style:
                              TextStyle(
                            color: Colors
                                .red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            else
              const Padding(
                padding:
                    EdgeInsets.all(
                        32.0),
                child: Text(
                  "Cart is empty",
                  style: TextStyle(
                    fontSize: 18,
                    color:
                        Colors.grey,
                  ),
                ),
              ),
            const SizedBox(
                height: 20),
            const Divider(),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                const Text(
                  "Total Price",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight
                            .w600,
                  ),
                ),
                Text(
                  "\$${totalPrice.toStringAsFixed(2)}",
                  style:
                      const TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight
                            .bold,
                    color: Color(
                        0xFF1DA1F2),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width:
                  double.infinity,
              height: 52,
              child:
                  ElevatedButton(
                style:
                    ElevatedButton
                        .styleFrom(
                  backgroundColor:
                      const Color(
                    0xFF1DA1F2,
                  ),
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius
                            .circular(
                                16),
                  ),
                ),
                onPressed:
                    quantity > 0
                        ? () {
                            _showSuccess(
                                context);
                          }
                        : null,
                child:
                    const Text(
                  "Make Purchase",
                  style:
                      TextStyle(
                    fontSize: 16,
                    color: Colors
                        .white,
                  ),
                ),
              ),
            ),
            const SizedBox(
                height: 12),
            SizedBox(
              width:
                  double.infinity,
              height: 52,
              child:
                  OutlinedButton(
                style:
                    OutlinedButton
                        .styleFrom(
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius
                            .circular(
                                16),
                  ),
                  side:
                      const BorderSide(
                    color: Color(
                        0xFF1DA1F2),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(
                      context);
                },
                child:
                    const Text(
                  "Continue Shopping",
                  style:
                      TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _qtyButton(
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.all(
                4),
        decoration:
            BoxDecoration(
          color: const Color(
              0xFF1DA1F2),
          borderRadius:
              BorderRadius
                  .circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  void _showSuccess(
      BuildContext context) {
    showDialog(
      context: context,
      builder: (_) =>
          AlertDialog(
        title: const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 50,
        ),
        content: const Text(
          "Order Placed Successfully!",
          textAlign:
              TextAlign.center,
          style: TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(
                  context);
              Navigator.pop(
                  context);
            },
            child:
                const Text("OK"),
          ),
        ],
      ),
    );
  }
}
