
//import 'package:coffee_card/screens/coffee_details.dart';
import 'package:coffee_card/screens/login.dart';
//import 'package:coffee_card/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
     title: "Coffee Page",
      home: LoginPage(),));
    //  MaterialApp(
    //  title: "Coffee Page",
    //   home: OrderPage(),));
      
      
  //     MaterialApp(
  //     title: "Coffee Page",
  //     home: Scaffold(
  //     appBar: AppBar(
  //     title: Text("Coffee Page"),
  //     backgroundColor: Colors.brown[700]!,
  //     centerTitle: true,
  //      ),
       
  //         body: Home(),
  //        bottomNavigationBar: BottomNavBar(),),
  //      ), 
   
  //);
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),

      child: Row(
        children: [
          Expanded(
            // This is the box that represents a vertical split of  the screen
            flex: 10,
            child: Column(
              // the coffee tile tile on top
              children: [
                Expanded(
                  flex: 1,

                  child: Row(
                    children: [
                      Expanded(
                  flex: 1,
                  child: CoffeeTile(
                  name: "Espresso Coffee",
                  imagepath: 'assets/images/Mocha.jpg', 
                  price: "30.00")
                ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: CoffeeTile(
                  name: "Espresso Coffee",
                  imagepath: 'assets/images/Mocha.jpg', 
                  price: "30.00")
                ),
              ],
            ),
          ),
          const Spacer(flex: 1,),
          Expanded(
            // Second Half of the screen
            flex: 10,
            child: Column(
              // The Top Column
              children: [
                Expanded(
                  flex: 1,
                 child: GestureDetector(
                  onTap: (){},
                  child:CoffeeTile(
                  name: "Espresso Coffee",
                  imagepath: 'assets/images/Mocha.jpg', 
                  price: "30.00"),)
                ),

                Expanded(
                  flex: 1,
                  child: CoffeeTile(
                  name: "Espresso Coffee",
                  imagepath: 'assets/images/Mocha.jpg', 
                  price: "30.00")
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CoffeeTile extends StatelessWidget {
  final String name;
  final String imagepath;
  final String price;
  const CoffeeTile(
  {super.key, 
  required this.name,
  required this.imagepath,
  required this.price,} );

  @override
  Widget build(BuildContext context) {
    return  Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ClipRRect(// To make it clickable
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                // the image in the coffee Tile
                                imagepath,
                                fit: BoxFit.cover,
                              ),
                     
                              ),
                            ),

                            Expanded(
                              // Lower part of cofee
                              flex: 1,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:[
                                        Text(// This is the text, The name of the coffee
                                        name,
                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,),
                                                          ),
 
                                    const SizedBox(height: 4,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      Icon(Icons.star, color: Colors.brown, size: 12,),
                                      Icon(Icons.star, color: Colors.brown, size: 12,),
                                      Icon(Icons.star, color: Colors.brown, size: 12,),
                                      Icon(Icons.star, color: Colors.brown, size: 12,),
                                      Icon(Icons.star, color: Colors.brown, size: 12,)

                                      ],
                                    ),
                                      //This is the price block
                                      Text(
                                        "\$ $price",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      ],
                                  ),
                                  ),
                                ],
                            
                              ),),],);
                          
  
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
            items: const[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "My Orders"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
            ]
          
          );
  }
}

