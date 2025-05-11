import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_app/models/navigation_controller.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text('My Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://icons.veryicon.com/png/o/miscellaneous/user-avatar/user-avatar-male-5.png'),
          ),
          const SizedBox(height: 12),
          const Text(
            'Sahil Patil',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            'sahilpatil1616@gmail.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Divider(),

          // Buttons
          ListTile(
            leading: const Icon(Icons.person, color: Colors.deepOrange,),
            title: const Text("Edit Profile"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.deepOrange,),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag,color: Colors.deepOrange,),
            title: const Text("My Orders"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16,color: Colors.deepOrange),
            onTap: () {
              Get.find<NavigationController>().changeTab(2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite,color: Colors.deepOrange,),
            title: const Text("Wishlist"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16,color: Colors.deepOrange),
            onTap: () {
              Get.find<NavigationController>().changeTab(1);

            },
          ),
          ListTile(
            leading: const Icon(Icons.smartphone,color: Colors.deepOrange,),
            title: const Text("Instagram Profile"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16,color: Colors.deepOrange),
            onTap: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // You can add logout logic here
              },
              icon: const Icon(Icons.logout, color: Colors.white,),
              label: const Text("Logout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
