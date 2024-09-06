
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List of image paths
  final List<String> imageUrls = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
  ];

  // List of names corresponding to the image URLs
  final List<String> names = [
    'John',
    'Jane',
    'Michael',
    'Emily',
  ];

  // Dummy data for the ListView
  final List<Map<String, String>> chatData = [
    {'name': 'John Doe', 'message': 'Hey, how are you?', 'image': 'assets/1.jpg'},
    {'name': 'Jane Smith', 'message': 'Are we still meeting today?', 'image': 'assets/2.jpg'},
    {'name': 'Michael Brown', 'message': 'Let\'s catch up later!', 'image': 'assets/3.jpg'},
    {'name': 'Emily Johnson', 'message': 'Can you send me the report?', 'image': 'assets/4.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/1.jpg"), // Replace with your image path
            radius: 20,
          ),
        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 29,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.black),
                onPressed: () {
                  // Add your camera action here
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.black),
                onPressed: () {
                  // Add your pen action here
                },
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none, // Remove border
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          // Horizontal List of CircleAvatars with Names
          Container(
            height: 120, // Adjust height as needed
            color: Colors.white, // Set background color to white
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              itemCount: imageUrls.length + 1, // +1 for the plus icon
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 40, // Adjust the radius as needed
                          child: Icon(Icons.add, color: Colors.black, size: 30),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Your story',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(imageUrls[index - 1]), // Adjust for index shift
                          radius: 40, // Adjust the radius as needed
                        ),
                        Positioned(
                          bottom: 45,
                          right: 8,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          child: SizedBox(
                            width: 80, // Adjust the width to fit the text
                            child: Text(
                              names[index - 1], // Use the names list
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),

          // Expanded ListView.builder for Chat List
          Expanded(
            child: ListView.builder(
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                final chat = chatData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Slidable(
                    key: Key(chat['name']!),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            // Handle camera action
                          },
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          icon: Icons.camera_alt,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            // Handle phone action
                          },
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          icon: Icons.phone,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            // Handle video action
                          },
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          icon: Icons.videocam,
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            // Handle delete action
                          },
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          icon: Icons.menu,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            // Handle notification action
                          },
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          icon: Icons.notifications,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            // Handle menu action
                          },
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: Container(
                      color: Colors.white, // Set row background color to white
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(chat['image']!),
                          radius: 30, // Increase the radius for a larger avatar
                        ),
                        title: Text(
                          chat['name']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18, // Increase the font size for the name
                          ),
                        ),
                        subtitle: Text(
                          chat['message']!,
                          style: TextStyle(fontSize: 16), // Increase the font size for the message
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.grey[300], // Set background color to grey
                          radius: 10, // Adjust radius for a smaller CircleAvatar
                          child: Icon(
                            Icons.check,
                            color: Colors.black,
                            size: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
