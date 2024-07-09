import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'detail_order_screen.dart';
import 'detail_screen.dart';
import 'all_categories.dart';
import 'order_summary_page.dart';
import 'wallet_page.dart';
import 'profile.dart'; // Import the ProfilePage
import 'support.dart'; // Import the SupportPage

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  int _currentBannerIndex = 0;
  final CarouselController _controller = CarouselController();

  final List<String> _bannerImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  final List<String> _categoryImages = [
    'assets/images/tarps.jpg',
    'assets/images/shadenets.jpg',
    'assets/images/pipes.jpg',
    'assets/images/seasonal.jpg',
    'assets/images/decorative.jpg',
  ];

  final List<String> _categoryLabels = [
    'TARPAULINS',
    'SHADENETS',
    'PIPES',
    'SEASONAL',
    'DECORATIVE',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow
        title: Image.asset(
          'assets/images/app_bar.png',
          height: 80, // Adjust the height as needed
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildPageContent(_currentIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildPageContent(int index) {
    switch (index) {
      case 0:
        return _buildHomeContent();
      case 1:
        return OrderSummaryPage();
      case 2:
        return ProfilePage();
      case 3:
        return WalletPage();
      case 4:
        return SupportPage();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSearchBar(),
          _buildBanner(),
          _buildCategoriesLabel(),
          _buildCategoriesGrid(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Column(
      children: [
        CarouselSlider(
          items: _bannerImages.map((item) => _buildBannerItem(item)).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentBannerIndex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _bannerImages.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentBannerIndex == entry.key ? Colors.blue : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBannerItem(String assetPath) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Image.asset(assetPath, fit: BoxFit.cover, width: 1000.0),
      ),
    );
  }

  Widget _buildCategoriesLabel() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AllCategoriesScreen()), // Navigate to the new categories screen
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'CATEGORIES',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          for (int index = 0; index < _categoryLabels.length; index++)
            StaggeredGridTile.count(
              crossAxisCellCount: index == 4 ? 4 : 2,
              mainAxisCellCount: index == 4 ? 2 : 2,
              child: _buildCategoryBox(index),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryBox(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              productName: _categoryLabels[index],
              productID: 'ID${index + 1}', // Example product ID
              productImage: _categoryImages[index],
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(_categoryImages[index], fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                _categoryLabels[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Order Summary',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent),
          label: 'Support',
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Dashboard(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}
