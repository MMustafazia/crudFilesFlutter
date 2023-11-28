import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class lock2 extends StatefulWidget {
  const lock2({super.key});

  @override
  State<lock2> createState() => _lock2State();
}

class _lock2State extends State<lock2> {
  @override
  Widget build(BuildContext context) {
    List imagesList = [
      {"id": 1, "image_path": "assets/images/2.jpg"},
      {"id": 2, "image_path": "assets/images/1.jpg"},
      {"id": 3, "image_path": "assets/images/3.jpg"},
    ];

    final CarouselController carouselController = CarouselController();
    int currentIndex = 0;
    PageController pageController = PageController();
    void onTap(pageValue) {
      setState(() {
        currentIndex = pageValue;
      });
      pageController.jumpToPage(pageValue);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              color: Colors.black,
            )),
        title: Text(
          "text here",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    print(currentIndex);
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    margin: EdgeInsets.only(right: 0, left: 0),
                    child: CarouselSlider(
                      items: imagesList
                          .map(
                            (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imagesList.asMap().entries.map((entry) {
                      print(entry);
                      print(entry.key);
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 17 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key
                                ? Colors.grey.shade200
                                : Colors.grey.shade200,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  child: Text(
                    "text here",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 15,
                  right: 15,
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.search), // Prefix icon (e.g., user icon)
                        suffixIcon: IconButton(
                          icon: Icon(
                              Icons.mic), // Suffix icon (e.g., clear button)
                          onPressed: () {
                            // Clear the text field
                          },
                        ),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Popular Food",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 10, right: 20),
                      height: 220,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "title",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.favorite_border)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 110,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.star),
                                Text(
                                  "Rating",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade600,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: 60,
                      child: Container(
                        height: 110,
                        width: 120,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade700, // Shadow color
                                offset: Offset(0,
                                    3), // Shadow position (horizontal, vertical)
                                blurRadius: 6, // Shadow blur radius
                                spreadRadius: 0, // Shadow spread radius
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.photo,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ]),
                  Stack(children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 10, right: 20),
                      height: 220,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "title",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.favorite_border)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 110,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.star),
                                Text(
                                  "Rating",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade600,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: 60,
                      child: Container(
                        height: 110,
                        width: 120,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade700, // Shadow color
                                offset: Offset(0,
                                    3), // Shadow position (horizontal, vertical)
                                blurRadius: 6, // Shadow blur radius
                                spreadRadius: 0, // Shadow spread radius
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.photo,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ]),
                  Stack(children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 10, right: 20),
                      height: 220,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "title",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.favorite_border)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 110,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.star),
                                Text(
                                  "Rating",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade600,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: 60,
                      child: Container(
                        height: 110,
                        width: 120,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade700, // Shadow color
                                offset: Offset(0,
                                    3), // Shadow position (horizontal, vertical)
                                blurRadius: 6, // Shadow blur radius
                                spreadRadius: 0, // Shadow spread radius
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.photo,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
              child: Row(
                children: [
                  Text(
                    "Top week deals",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    height: 230,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 110,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(Icons.photo),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.favorite_border)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [Text("price")],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star),
                                      Text(
                                        "Rating",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.add))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    height: 230,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 110,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(Icons.photo),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.favorite_border)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [Text("price")],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star),
                                      Text(
                                        "Rating",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.add))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    height: 230,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 110,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(Icons.photo),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "title",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.favorite_border)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [Text("price")],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star),
                                      Text(
                                        "Rating",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.add))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
