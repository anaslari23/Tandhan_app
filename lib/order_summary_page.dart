import 'package:flutter/material.dart';

import 'detail_order_screen.dart';

class OrderSummaryPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      "image": 'assets/images/tarps.jpg',
      "company": "Balaji Ltd",
      "orderID": "#ORD92836",
      "status": "Delivered",
      "statusColor": Colors.green,
      "quantity": 2,
      "unit": "Pieces"
    },
    {
      "image": 'assets/images/shadenets.jpg',
      "company": "Maithhan Steel",
      "orderID": "#ORD9245",
      "status": "Out for Delivery",
      "statusColor": Colors.orange,
      "quantity": 5,
      "unit": "Pieces"
    },
    {
      "image": 'assets/images/pipes.jpg',
      "company": "Tvc Ltd",
      "orderID": "#ORD92905",
      "status": "Delivered",
      "statusColor": Colors.green,
      "quantity": 8,
      "unit": "Pieces"
    },
    {
      "image": 'assets/images/seasonal.jpg',
      "company": "Finolex Pvt Ltd",
      "orderID": "#ORD98836",
      "status": "Packed",
      "statusColor": Colors.red,
      "quantity": 3,
      "unit": "Pieces"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailPage(order: order),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        order['image'],
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order['company'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(order['orderID']),
                          SizedBox(height: 5),
                          Text(
                            order['status'],
                            style: TextStyle(
                              color: order['statusColor'],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Wrap(
                            spacing: 10,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.grey[200],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('Download Invoice'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.grey[200],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text('Order Again'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            order['quantity'].toString(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            order['unit'],
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OrderSummaryPage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}
