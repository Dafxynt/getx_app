import 'package:flutter/material.dart';
import 'package:app_getx/reuseprofile/profileHeader.dart';
import 'package:app_getx/reuseprofile/profileoption.dart';
import 'package:app_getx/reuseprofile/logoutbutton.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileHeader(
                        imageUrl: 'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_1280.png',
                        name: 'Irawan Daffa',
                        email: 'irawandaffa910@gmail.com',
                      ),
                      // Profile options
                      ProfileOption(
                        icon: Icons.account_circle,
                        title: 'Account Information',
                        onTap: () {
                          // Handle navigation or action
                        },
                      ),
                      ProfileOption(
                        icon: Icons.location_on,
                        title: 'Delivery Address',
                        onTap: () {
                          // Handle navigation or action
                        },
                      ),
                      ProfileOption(
                        icon: Icons.payment,
                        title: 'Payment Method',
                        onTap: () {
                          // Handle navigation or action
                        },
                      ),
                      ProfileOption(
                        icon: Icons.lock,
                        title: 'Password',
                        onTap: () {
                          // Handle navigation or action
                        },
                      ),
                      ProfileOption(
                        icon: Icons.people,
                        title: 'Reference Friends',
                        onTap: () {
                          // Handle navigation or action
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // Logout button fixed at the bottom
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: LogoutButton(
                  onTap: () {
                    // Handle log out action
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
