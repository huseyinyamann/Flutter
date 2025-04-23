import 'package:flutter/material.dart';

class SocialMediaSection extends StatelessWidget {
  final Map<String, Color> socialMedia;

  const SocialMediaSection({
    Key? key,
    required this.socialMedia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.only(
          left: 16, right: 16, top: 8, bottom: 8), // Padding optimize edildi
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Social Media',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Başlık ve grid arasında çok az boşluk
          const SizedBox(height: 20),
          GridView.builder(
            padding: EdgeInsets.zero, // Grid için padding'i sıfırla
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 55,
              mainAxisExtent: 80, // Daha küçük bir yükseklik değeri
            ),
            itemCount: socialMedia.length,
            itemBuilder: (context, index) {
              final entry = socialMedia.entries.elementAt(index);
              return _buildSocialMediaItem(entry.key, entry.value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaItem(String name, Color color) {
    IconData icon;

    switch (name) {
      case 'Twitter':
        icon = Icons.face;
        break;
      case 'Instagram':
        icon = Icons.camera_alt;
        break;
      case 'LinkedIn':
        icon = Icons.work;
        break;
      case 'YouTube':
        icon = Icons.play_arrow;
        break;
      default:
        icon = Icons.public;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
        ),
        const SizedBox(height: 4), // 4'ten 2'ye düşürüldü
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
