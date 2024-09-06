import 'package:flutter/material.dart';

class People extends StatefulWidget {
  const People({super.key});

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  final List<Map<String, String>> people = [
    {"name": "Your story", "image": "assets/add_image.jpg", "description": "Add your story"},
    {"name": "John Doe", "image": "assets/1.jpg"},
    {"name": "Jane Doe", "image": "assets/2.jpg"},
    {"name": "Mark Smith", "image": "assets/3.jpg"},
    {"name": "Lucy Brown", "image": "assets/4.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/1.jpg"),
            radius: 20,
          ),
        ),
        title: const Text(
          'People',
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
                icon: const Icon(Icons.chat, color: Colors.black),
                onPressed: () {
                  // Add your chat action here
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: const Icon(Icons.person, color: Colors.black),
                onPressed: () {
                  // Add your person action here
                },
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(people[index]['image'] ?? 'assets/default.jpg'),
                                radius: 40,
                              ),
                              if (index == 0)
                                const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              if (index != 0)  // Add the green dot for all except the first item
                                Positioned(
                                  bottom: 2,
                                  right: 10,
                                  child: CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.white, // White border around the green dot
                                    child: CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.green, // Green dot
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          title: Text(
                            people[index]['name'] ?? 'Unknown',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: index == 0
                              ? Text(people[index]['description'] ?? 'Add your story')
                              : null,  // Only display subtitle for the first item
                          trailing: index == 0
                              ? null  // Remove trailing icon for the first item
                              : CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: const Icon(Icons.waving_hand, color: Colors.black),
                          ),
                          onTap: () {
                            // Add your action for the items here
                          },
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                      ],
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    'Recently active',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("assets/2.jpg"),
                      radius: 30,
                    ),
                    title: const Text(
                      'Alice Johnson',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: const Icon(Icons.waving_hand, color: Colors.black),
                    ),
                    onTap: () {
                      // Add your action for the recently active item here
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
