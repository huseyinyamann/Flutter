import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class User {
  final int id;
  final String name;
  final String? subtitle;
  final String avatar;
  final bool verified;
  final bool premium;
  final String status;

  User({
    required this.id,
    required this.name,
    this.subtitle,
    required this.avatar,
    this.verified = false,
    this.premium = false,
    required this.status,
  });
}

class ShufflePage extends StatefulWidget {
  @override
  _ShufflePageState createState() => _ShufflePageState();
}

class _ShufflePageState extends State<ShufflePage> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';

  final List<User> users = [
    User(
      id: 1,
      name: 'Hikâyen',
      avatar:
          'https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop',
      verified: true,
      status: 'online',
    ),
    User(
      id: 2,
      name: 'ACG',
      avatar:
          'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop',
      premium: true,
      status: 'online',
    ),
    User(
      id: 3,
      name: 'cihan',
      subtitle: 'ceceo',
      avatar:
          'https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop',
      status: 'offline',
    ),
    User(
      id: 4,
      name: 'test2',
      avatar:
          'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop',
      status: 'online',
    ),
    User(
      id: 5,
      name: 'Arif',
      subtitle: 'hissizleşmek için çok şey hissetmek gerek',
      avatar:
          'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop',
      status: 'offline',
    ),
    User(
      id: 6,
      name: 'Zeynep',
      subtitle: 'hayat güzel',
      avatar:
          'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop',
      verified: true,
      status: 'online',
    ),
    User(
      id: 7,
      name: 'Mehmet',
      subtitle: 'yazılım geliştirici',
      avatar:
          'https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop',
      status: 'online',
    ),
    User(
      id: 8,
      name: 'Ayşe',
      avatar:
          'https://images.pexels.com/photos/1858175/pexels-photo-1858175.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop',
      premium: true,
      status: 'offline',
    ),
  ];

  List<User> get filteredUsers {
    return users.where((user) {
      final searchLower = searchText.toLowerCase();
      return user.name.toLowerCase().contains(searchLower) ||
          (user.subtitle?.toLowerCase().contains(searchLower) ?? false);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8B5CF6),
              Color(0xFFA855F7),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader(),

              // Search Bar
              _buildSearchBar(),

              // Content Container
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemCount: filteredUsers.length,
                          itemBuilder: (context, index) {
                            return _buildUserItem(filteredUsers[index]);
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '2:57',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Container(
                width: 18,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 4),
              Container(
                width: 16,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 4),
              Container(
                width: 24,
                height: 12,
                decoration: BoxDecoration(
                  color: Color(0xFF4ADE80),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Kullanıcı adı, biyografi, şehir',
            hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
                color: Color(0xFF6B7280),
                size: 20,
              ),
            ),
          ),
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF374151),
          ),
        ),
      ),
    );
  }

  Widget _buildUserItem(User user) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFF3F4F6),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Avatar with indicators
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  user.avatar,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              // Online indicator
              if (user.status == 'online')
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Color(0xFF10B981),
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              // Verified badge
              if (user.verified)
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color(0xFF3B82F6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(width: 15),

          // User details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                if (user.subtitle != null) ...[
                  SizedBox(height: 2),
                  Text(
                    user.subtitle!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Premium badge
          if (user.premium)
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0xFFF59E0B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.star,
                color: Colors.white,
                size: 16,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem(Icons.chat_bubble_outline, true),
          _buildTabItem(Icons.access_time, false),
          _buildTabItem(Icons.image_outlined, false),
          _buildTabItem(Icons.more_horiz, false),
        ],
      ),
    );
  }

  Widget _buildTabItem(IconData icon, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Icon(
        icon,
        size: 24,
        color: isActive ? Color(0xFFFF6B6B) : Color(0xFF9CA3AF),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

// Ana uygulama
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shuffle App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Roboto',
      ),
      home: ShufflePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(MyApp());
}
