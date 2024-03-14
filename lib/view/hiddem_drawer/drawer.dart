// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:videoplayer/view/core.dart';

class HiddenDrawer extends StatelessWidget {
  const HiddenDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    FirebaseAuth auth = FirebaseAuth.instance;
    return Drawer(
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("User")
            .doc(auth.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
              ),
            );
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text("No data found"));
          }
          final userData = snapshot.data!.data() as Map<String, dynamic>?;

          if (userData == null) {
            return const Text("User data is null");
          }

          return Column(
            children: [
              hight30,
              Container(
                height: mediaquery.height * .2,
                width: mediaquery.width * .5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                          "${userData["imageurl"]}",
                        ),
                        fit: BoxFit.cover)),
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(userData['imageurl'] ?? ''),
              ),
              ListTile(
                title: Text(
                  "${userData['name']}",
                  style: const TextStyle(fontSize: 20),
                ), // Handle null name
              ),
              ListTile(
                title: Text(
                  userData['emails'] ?? 'No email',
                  style: const TextStyle(fontSize: 20),
                ), // Handle null email
              ),
              ListTile(
                title: Text(
                  userData['dob'] ?? 'No date of birth',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ), // Handle null dob
              ),
            ],
          );
        },
      ),
    );
  }
}
