import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> profileImages = [
    "images/i1.jpg",
    "images/i3.jpg",
    "images/i2.jpg",
    "images/i4.jpg",
    "images/i5.webp",
    "images/i6.webp",
    "images/i7.webp",
    "images/i8.webp",
    "images/i9.webp",
  ];

  List<String> profileNames = [
    "Alice",
    "Bob",
    "Charlie",
    "David",
    "Emma",
    "Frank",
    "Grace",
    "Hannah",
    "Ivan",
  ];

  List<String> postImages = [
    "images/i1.jpg",
    "images/i3.jpg",
    "images/i2.jpg",
    "images/i4.jpg",
    "images/i5.webp",
    "images/i6.webp",
    "images/i7.webp",
    "images/i8.webp",
    "images/i9.webp",
  ];

  List<bool> likedPosts = List.generate(9, (index) => false); // Track likes
  List<bool> isBook = List.generate(9, (index) => false);
  void toggleLike(int index) {
    setState(() {
      likedPosts[index] = !likedPosts[index]; // Toggle state
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/ig_text.png', height: 50),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.chat_bubble_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Story Section
            SizedBox(
              height: 120,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    8,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('images/i10.webp'),
                                radius: 40,
                              ),
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(
                                  profileImages[index],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            profileNames[index],
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(),

            // Post Section
            Column(
              children: List.generate(
                8,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('images/i10.webp'),
                                radius: 16,
                              ),
                              CircleAvatar(
                                radius: 14,
                                backgroundImage: AssetImage(
                                  profileImages[index],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Text(
                            profileNames[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.more_vert),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onDoubleTap: () => toggleLike(index),
                      child: Image.asset(
                        postImages[index % postImages.length],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        SizedBox(width: 20),
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color:
                                likedPosts[index] ? Colors.red : Colors.black,
                          ),
                          onPressed: () => toggleLike(index),
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.comment),
                        SizedBox(width: 20),
                        Icon(Icons.share),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.bookmark_add_outlined,
                            color: isBook[index] ? Colors.blue : Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              isBook[index] = !isBook[index];
                            });
                          },
                        ),
                      ],
                    ),

                    // Added caption text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(
                        "This is post ${index + 1} by ${profileNames[index]}",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),

                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
