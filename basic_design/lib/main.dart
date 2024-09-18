import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white60,
        body: Center(
          child: ProfileCard(),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Profil resminin linki
            ),
            SizedBox(height: 10),
            Text(
              'Easin Arafat',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'UI/UX Designer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.abc),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.linked_camera),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.abc),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '240',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text('Following'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '24K',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text('Followers'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 15,
              child: CircleAvatar(
                radius: 12,
                backgroundImage:
                NetworkImage('https://via.placeholder.com/50'), // Diğer resim
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: Text('Follow Now'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
