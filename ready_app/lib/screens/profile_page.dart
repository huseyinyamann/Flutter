import 'package:flutter/material.dart';
import 'package:profil_sayfasi/widgets/common/bottom_navbar.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/stats_section.dart';
import '../widgets/profile/social_media_section.dart';
import '../widgets/profile/photos_section.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Ana ScrollController tanımlıyoruz
  final ScrollController _scrollController = ScrollController();

  // Kullanıcı bilgileri
  final String coverImageUrl =
      'https://images.unsplash.com/photo-1506377295352-e3154d43ea9e?q=80&w=1000';
  final String profileImageUrl =
      'https://randomuser.me/api/portraits/women/44.jpg';
  final String name = 'Sarah Anderson';
  final String username = '@sarahanderson';
  final String location = 'New York, USA';
  final String bio =
      'Photography enthusiast & Digital creator\nLiving life through my lens 📸';

  // İstatistikler
  final int followers = 10;
  final int chats = 131;
  final int likes = 256;
  final int following = 45;

  // Sosyal medya hesapları - Turuncu renkler
  final Map<String, Color> socialMedia = {
    'Twitter': const Color(0xFFFF6B00), // Koyu turuncu
    'Instagram': const Color(0xFFFF8833), // Orta turuncu
    'LinkedIn': const Color(0xFFFF9C5D), // Açık turuncu
    'YouTube': const Color(0xFFFFAE77), // Çok açık turuncu
  };

  // Fotoğraf URL'leri - 9 adet fotoğraf (3 tane daha eklendi)
  final List<String> photos = [
    'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=150',
    'https://images.unsplash.com/photo-1610438235354-a6ae5528385c?q=80&w=150',
    'https://images.unsplash.com/photo-1493246507139-91e8fad9978e?q=80&w=150',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=150',
    'https://images.unsplash.com/photo-1485462537746-965f33f7f6a7?q=80&w=150',
    'https://images.unsplash.com/photo-1506929562872-bb421503ef21?q=80&w=150',
    // Ek 3 fotoğraf
    'https://images.unsplash.com/photo-1517328894681-0f5dfabd463c?q=80&w=150',
    'https://images.unsplash.com/photo-1513542789411-b6a5d4f31634?q=80&w=150',
    'https://images.unsplash.com/photo-1524644388610-d973c5ff22ea?q=80&w=150',
  ];

  void _handleSendMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Mesaj gönderme işlevi')),
    );
  }

  void _handleMoreOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.block),
                title: const Text('Engelle'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Kullanıcı engellendi')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.report),
                title: const Text('Bildir'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Kullanıcı bildirildi')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Profili Paylaş'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profil paylaşıldı')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Geri butonu tıklandı')),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.settings, color: Colors.white),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ayarlar butonu tıklandı')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // ScrollController'ı ekledik
        child: Column(
          children: [
            // Profil Başlığı ve Kapak
            ProfileHeader(
              coverImageUrl: coverImageUrl,
              profileImageUrl: profileImageUrl,
              name: name,
              username: username,
              location: location,
              bio: bio,
            ),

            // İstatistikler
            StatsSection(
              followers: followers,
              chats: chats,
              likes: likes,
              following: following,
            ),

            // Sosyal Medya Hesapları
            SocialMediaSection(socialMedia: socialMedia),

            // Fotoğraflar - ScrollController'ı ilettik
            PhotosSection(
              photos: photos,
              scrollController: _scrollController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Controller'ı temizle
    super.dispose();
  }
}
