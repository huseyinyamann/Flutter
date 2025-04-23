import 'package:flutter/material.dart';

class StatsSection extends StatelessWidget {
  final int followers;
  final int chats;
  final int likes;
  final int following;

  const StatsSection({
    Key? key,
    required this.followers,
    required this.chats,
    required this.likes,
    required this.following,
  }) : super(key: key);

  void _showStatsDetail(BuildContext context, String label, int value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(label),
          content: Text('Toplam: $value'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Kapat'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(context, 'Takipçiler', followers),
          _buildVerticalDivider(),
          _buildStatItem(context, 'Sohbetler', chats),
          _buildVerticalDivider(),
          _buildStatItem(context, 'Beğeniler', likes),
          _buildVerticalDivider(),
          _buildStatItem(context, 'Takip', following),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, int value) {
    return GestureDetector(
      onTap: () => _showStatsDetail(context, label, value),
      child: Column(
        children: [
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.grey.shade200,
    );
  }
}
