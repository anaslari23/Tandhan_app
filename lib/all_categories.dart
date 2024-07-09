import 'package:flutter/material.dart';

class AllCategoriesScreen extends StatefulWidget {
  @override
  _AllCategoriesScreenState createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  final List<Map<String, String>> categories = [
    {"image": 'assets/images/tarps.jpg', "label": "TARPAULINS"},
    {"image": 'assets/images/shadenets.jpg', "label": "SHADENETS"},
    {"image": 'assets/images/pipes.jpg', "label": "PIPES"},
    {"image": 'assets/images/seasonal.jpg', "label": "SEASONAL"},
    {"image": 'assets/images/decorative.jpg', "label": "DECORATIVE"},
    // Add more categories if needed
  ];

  final List<Color> colors = [Colors.blue, Colors.green, Colors.yellow, Colors.black];
  String? _selectedCategory;

  void _onCategoryTap(BuildContext context, String category) {
    setState(() {
      _selectedCategory = category;
    });
    // Handle category tap, navigate to corresponding screen
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$category clicked')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('ALL CATEGORY'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button action
            },
          ),
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 120,
            color: Colors.black,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                bool isSelected = _selectedCategory == categories[index]['label'];
                return InkWell(
                  onTap: () => _onCategoryTap(context, categories[index]['label']!),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    categories[index]['image']!,
                                    fit: BoxFit.cover,
                                    height: 80,
                                    width: 80,
                                    color: isSelected ? Colors.black.withOpacity(0.5) : null,
                                    colorBlendMode: isSelected ? BlendMode.darken : null,
                                  ),
                                  if (isSelected)
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Icon(Icons.check_circle, color: Colors.white, size: 40),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              categories[index]['label']!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'ALL CATEGORY',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: colors.map((color) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            colorToString(color),
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String colorToString(Color color) {
    if (color == Colors.blue) return 'Blue';
    if (color == Colors.green) return 'Green';
    if (color == Colors.yellow) return 'Yellow';
    if (color == Colors.black) return 'Black';
    return '';
  }
}

void main() {
  runApp(MaterialApp(
    home: AllCategoriesScreen(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}
