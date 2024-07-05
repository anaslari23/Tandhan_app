import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: const Dashboard(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Footwear",
          style: TextStyle(fontWeight: FontWeight.bold),
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
      body: _currentIndex == 0
          ? _buildHomeContent()
          : _currentIndex == 1
          ? OrderSummaryPage()
          : _currentIndex == 2
          ? _buildProfileContent()
          : _currentIndex == 3
          ? WalletPage()
          : _buildSupportContent(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
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

  Widget _buildProfileContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSearchBar(),
            SizedBox(height: 16),
            _buildGreeting(),
            SizedBox(height: 16),
            _buildProfileOptions(),
            SizedBox(height: 16),
            _buildAccountSettings(),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportContent() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Quick Customer Support"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Handle profile action
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Toll Free Number 1800 5566"),
            SizedBox(height: 20),
            Text(
              "Track Your Order",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildOrderItem("Shadenets", "20x12ft 20 GSM | Green", 1, "Out for Delivery"),
            _buildOrderItem("Tarpaulins", "24x12ft 200 GSM | Yellow", 2, "Packed"),
            ElevatedButton(
              onPressed: () {
                // Handle "Raise A Ticket" action
              },
              child: Text("Raise A Ticket"),
            ),
            SizedBox(height: 20),
            Text(
              "WHAT ISSUES ARE YOU FACING?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildSupportOption("WANT TO MANAGE MY ORDER?", "View, cancel or return an order"),
            _buildSupportOption("WANT TO CONTACT THE DISTRIBUTOR?", "Deactivate, Customer review, Upgrade, etc."),
            _buildSupportOption("WANT TO CREATE NEW ACCOUNT?", "New account create for a individual"),
            _buildSupportOption("WANT TO KNOW MORE?", "Know app features and tutorials."),
            _buildSupportOption("OTHERS", "Select your own issue."),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String title, String description, int quantity, String status) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.image), // Placeholder for product image
        title: Text(title),
        subtitle: Text(description),
        trailing: Column(
          children: [
            Text("$quantity Packet(s)"),
            Text(status),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(onPressed: () {}, child: Text("Download invoice")),
                TextButton(onPressed: () {}, child: Text("Order Again")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportOption(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        // Handle option selection
      },
    );
  }

  Widget _buildProfileSearchBar() {
    return TextField(
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
    );
  }

  Widget _buildGreeting() {
    return Text(
      'Hello, User!',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildProfileOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileOptionItem(Icons.shopping_bag, 'Orders', OrdersPage()),
        _buildProfileOptionItem(Icons.card_giftcard, 'Rewards', RewardsPage()),
        _buildProfileOptionItem(Icons.account_balance_wallet, 'Wallet', WalletPage()),
        _buildProfileOptionItem(Icons.local_offer, 'Offers/Schemes', OffersPage()),
        _buildProfileOptionItem(Icons.support_agent, 'Raise a Ticket', RaiseTicketPage()),
        _buildProfileOptionItem(Icons.track_changes, 'Track Payment', TrackPaymentPage()),
      ],
    );
  }

  Widget _buildProfileOptionItem(IconData icon, String label, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label, style: TextStyle(fontSize: 18)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  Widget _buildAccountSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          'Account Settings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _buildProfileOptionItem(Icons.edit, 'Edit/Add Customer', EditCustomerPage()),
        _buildProfileOptionItem(Icons.notifications, 'Notifications', NotificationsPage()),
        _buildProfileOptionItem(Icons.language, 'Select Language', LanguagePage()),
        _buildProfileOptionItem(Icons.description, 'Account Statement', AccountStatementPage()),
        _buildProfileOptionItem(Icons.document_scanner, 'Documents', DocumentsPage()),
      ],
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
      child: Text(
        'CATEGORIES',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildCategoryBox(index);
        },
      ),
    );
  }

  Widget _buildCategoryBox(int index) {
    final categoryImages = [
      'assets/images/tarps.jpg',
      'assets/images/shadenets.jpg',
      'assets/images/pipes.jpg',
      'assets/images/seasonal.jpg',
      'assets/images/decorative.jpg',
      'assets/images/others.jpg',
    ];

    final categoryLabels = [
      'TARPAULINS',
      'SHADENETS',
      'PIPES',
      'SEASONAL',
      'DECORATIVE',
    ];

    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(categoryImages[index], fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              categoryLabels[index],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
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

class OrderSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Order Summary Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Wallet",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFilterButton("LAST 10"),
                    _buildFilterButton("LAST WEEK"),
                    _buildFilterButton("LAST MONTH"),
                    _buildFilterButton("CUSTOM", isSelected: true),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDatePicker("From Date"),
                    _buildDatePicker("To Date"),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Download",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Balance - 147pts",
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 16),
                _buildTransactionList(),
                SizedBox(height: 16), // Add some space
                ElevatedButton(
                  onPressed: () {
                    // Handle reward button press
                    // Navigate to reward page or perform reward action
                  },
                  child: Text(
                    "Rewards",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Balance - 147pts",
                  style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 16),
                _buildTransactionList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, {bool isSelected = false}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.black : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          side: BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(String label) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return Column(
      children: List.generate(7, (index) {
        return Card(
          child: ListTile(
            leading: Text("10TH\nMAY\n2024", textAlign: TextAlign.center),
            title: Text("# Transaction ID"),
            subtitle: Text("# Order ID"),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Rewards - 21"),
                Text("₹ 21,000", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// Blank Pages for Profile Options
class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: Center(
        child: Text(
          'Orders Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class RewardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rewards')),
      body: Center(
        child: Text(
          'Rewards Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class OffersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offers/Schemes')),
      body: Center(
        child: Text(
          'Offers/Schemes Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class RaiseTicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Raise a Ticket')),
      body: Center(
        child: Text(
          'Raise a Ticket Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class TrackPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Track Payment')),
      body: Center(
        child: Text(
          'Track Payment Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class EditCustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit/Add Customer')),
      body: Center(
        child: Text(
          'Edit/Add Customer Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Center(
        child: Text(
          'Notifications Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Language')),
      body: Center(
        child: Text(
          'Select Language Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class AccountStatementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Statement')),
      body: Center(
        child: Text(
          'Account Statement Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class DocumentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Documents')),
      body: Center(
        child: Text(
          'Documents Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
