import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int _selectedIndex = 0; // Index to keep track of the selected tab

  // Sample data for the ListView.builder
  final List<Map<String, String>> _listItems = [
    {
      'image': 'assets/microsoft.png',
      'text': 'Microsoft',
      'description': 'Science,technology and engineering.'
    },
    {
      'image': 'assets/disney.png',
      'text': 'Disney',
      'description': 'Disney magic right at your fingertip.'
    },
    {
      'image': 'assets/instagram.png',
      'text': 'Instagram',
      'description': 'Bringing you closer to the people.'
    },
    {
      'image': 'assets/mc.png',
      'text': "McDonald's",
      'description': 'Best food.'
    },
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
          'Discover',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 29,
          ),
        ),
      ),
      body: Column(
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
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 170,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0
                          ? Colors.grey[300]
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "FOR YOU",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 170,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1
                          ? Colors.grey[300]
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "BUSINESSES",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _selectedIndex == 0
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Recent',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage("assets/apple.png"),
                            radius: 30,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Apple',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage("assets/samsung.png"),
                            radius: 30,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Samsung',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                            AssetImage("assets/airbnb.png"),
                            radius: 30,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Airbnb',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("More",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black
                  ),),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: _listItems.length,
                    itemBuilder: (context, index) {
                      final item = _listItems[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(item['image']!),
                          radius: 30,
                        ),
                        title: Text(item['text']!),
                        subtitle: Text(item['description']!),
                      );
                    },
                  ),
                ),
              ],
            )
                : Center(
              child: Text(
                'Content for BUSINESSES',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
