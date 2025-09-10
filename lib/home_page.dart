import 'dart:ui';

import 'package:coffee_shop/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab=0;
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          CircleAvatar(
            radius: 35,
            child: ClipOval(
              child: Image.asset('asset/la.jpg',),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text('Find The best \ncoffee for you',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,),
                hintText: 'Find your Coffee',
                hintStyle: TextStyle(fontSize: 16,color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.white30)
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 30,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  separatorBuilder:(_,__)=>SizedBox(width: 15,) ,
                  itemCount: tabs.length,
                itemBuilder: (context,index){
                    final bool active=index==selectedTab;
                    return GestureDetector(
                      onTap: (){
                        setState(()=> selectedTab =index );
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          // color: active? Colors.orange : Colors.grey
                        ),
                        child:  Text(tabs[index],style: TextStyle(fontSize: 16,color: active? Colors.orange : Colors.grey), ),
                      ),
                    );
                },
              ),
            ),
            Container(
              height: 320,
              child: ListView.separated(itemCount: productDetails.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context,index){
                return SizedBox(
                  width: 16,
                );
                },
                itemBuilder: (context,index){
                  return InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: AssetImage(productDetails[index]['image']!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.3), // important!
                                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        child: Text(
                                          productDetails[index]['rating']!,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text(productDetails[index]['title']!,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text(productDetails[index]['sub_title']!,style: TextStyle(fontSize: 16,color: Colors.grey),),
                            SizedBox(height: 15,),
                            Row(
                              spacing: 60,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: productDetails[index]['price']![0],
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.orangeAccent),
                                      ),
                                      TextSpan(
                                        text: productDetails[index]['price']!.substring(1),
                                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,),
                                      )
                                    ]
                                  ),
                                ),
                                IconButton(onPressed: (){},
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.orangeAccent,
                                    ),
                                    icon: Icon(Icons.add,color: Colors.white,))
                              ],
                            )

                          ],
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(product: productDetails[index],)));
                    },
                  );
              }, ),
            ),
            SizedBox(height: 20,),
            Text('Special offer for today',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 140,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(productDetails[1]['image']!),fit: BoxFit.cover)
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text('5 Coffee bins you must Try!!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,),)),
                        SizedBox(height: 5,),
                        Text('10% off today',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orangeAccent),)
                      ],
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
          },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notification'),
      ]),
    );
    
  }
}
