import 'package:crud/class/theme.dart';
import 'package:crud/class/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stackbuilder extends StatefulWidget {
  const Stackbuilder({super.key});

  @override
  State<Stackbuilder> createState() => _StackbuilderState();
}

class _StackbuilderState extends State<Stackbuilder> {
  CardViewModel cardViewModel = new CardViewModel();
  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent,
        title: Container(
          width: 50, // Adjust the width as needed
          child: Slider(
            value: themeNotifier.currentTheme.brightness == Brightness.dark
                ? 1.0
                : 0.0,
            onChanged: (value) {
              if (value == 0.0) {
                themeNotifier.toggleLightTheme();
              } else {
                themeNotifier.toggleDarkTheme();
              }
            },
            divisions: 1,
            label: themeNotifier.currentTheme.brightness == Brightness.dark
                ? 'Dark'
                : 'Light',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: cardViewModel.stackbuilderdataList.length,
                itemBuilder: (context, index) {
                  final cardData = cardViewModel.stackbuilderdataList[index];
                  return Container(
                    child: Stack(children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 10, right: 35),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cardData.title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    cardData.rating,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print(cardData.image);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade600,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                          child: Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                cardData.image,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ]),
                  );
                }),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.abc_sharp,
                  size: 120,
                )),
          ))
        ],
      ),
    );
  }
}
