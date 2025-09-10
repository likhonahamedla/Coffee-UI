import 'dart:ui';

import 'package:flutter/material.dart';
import 'data.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, String> product;
  const DetailsPage({super.key, required this.product});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorite = false;
  bool isExpended = false;
  final String description =
      "Cappuccino is a classic Italian coffee made with bold espresso, "
      "creamy steamed milk, and airy foam on top. It offers a smooth balance "
      "of strong flavor and gentle sweetness. Loved worldwide for its rich aroma "
      "and velvety texture, it’s a timeless favorite. Perfect for mornings, "
      "conversations, or simply enjoying a cozy moment.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Stack(
            children: [
              Container(
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(widget.product['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black45,
                      ),
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios_new, size: 30),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black45,
                      ),
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                        color: isFavorite ? Colors.orange : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  widget.product['title']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  widget.product['sub_title']!,
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  widget.product['rating']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.coffee_maker_outlined,
                                          color: Colors.orange,
                                          size: 30,
                                        ),
                                        Text(
                                          'Coffee',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.water_drop,
                                          color: Colors.orange,
                                          size: 30,
                                        ),
                                        Text(
                                          'Milk',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Medium Rosted',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Description',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            isExpended ? description : description.substring(0, 100) + ' ...',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isExpended = !isExpended;
              });
            },
            child: Text(
              isExpended ? 'Show less' : 'show More',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 200,
        color: Colors.black,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Size',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChoiceChip(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    'S',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  selected: false,
                ),
                ChoiceChip(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    'M',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  selected: true,
                ),
                ChoiceChip(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    'L',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  selected: false,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Text(
                      widget.product['price']!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                    ),
                  ),
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
