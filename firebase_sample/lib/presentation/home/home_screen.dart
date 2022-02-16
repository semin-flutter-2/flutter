import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/presentation/add_user/add_user_screen.dart';
import 'package:firebase_sample/presentation/photo_list/photo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userName;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Text('로그아웃'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddUserScreen()),
                );
              },
              child: const Text('유저 추가'),
            ),
            ElevatedButton(
              onPressed: () async {
                final userSnapshot =
                    await users.doc('NK9BHJKpoFNTW9JtN00j').get();
                final user = userSnapshot.data()! as Map<String, dynamic>;

                setState(() {
                  userName = user['full_name'];
                });
              },
              child: const Text('유저 정보 가져오기'),
            ),
            if (userName != null) Text(userName!),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: const Text('유저 정보 리얼타임으로 가져오기'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhotoListScreen()),
                );
              },
              child: const Text('사진 업로드'),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: users.snapshots(),
              builder: (context, snapshot) {
                return ListView(
                  shrinkWrap: true,
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['full_name']),
                    );
                  }).toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
