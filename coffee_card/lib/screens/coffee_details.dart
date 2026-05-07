import 'package:coffee_card/main.dart';
import 'package:flutter/material.dart';

class CoffeeDetailsPage extends StatelessWidget {
  const CoffeeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Encloses the entire Page
        child: Column(
          children: [
            Expanded(
              // This is the Image at the top of the Screen
              flex: 5,
              child: Stack(
                children: [
                  ClipRRect(
                    // For rounded corners
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),

                    child: Image.asset(
                      "assets/images/Mocha.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    // This is the back Button at the top of the screen
                    top: 15,
                    left: 15,
                    child: BackButton(),
                  ),
                ],
              ),
            ),

            Expanded(
              //This is the Title Section
              flex: 1,

              child: BodyTitle(title: "Mocha Coffee"),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                // To add some padding between the body of scrollable text and the edges of the phone
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BodyText(
                        bodytext:
                            "Indulge in the perfect harmony of rich, velvety chocolate and bold, full-bodied espresso with our signature Mocha. Crafted from freshly roasted, ethically sourced Arabica beans, this classic favorite is carefully blended with premium dark cocoa and perfectly steamed milk, creating a luxuriously smooth and creamy texture. Topped with a generous swirl of house-made whipped cream and a light dusting of cocoa powder, every single sip offers a comforting balance of sweet and bittersweet flavors. Whether you need a strong morning pick-me-up to start your day or a cozy afternoon treat to unwind, our Mocha is designed to warm your soul and satisfy your sweet tooth. Experience the ultimate chocolate-coffee bliss.",
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        // This holds the horizontal scrollable Coffee tiles after the body section
                        height: 300,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CoffeeTile(
                              name: "Espresso Coffee",
                              imagepath: 'assets/images/Mocha.jpg',
                              price: "30.00",
                            ),

                            CoffeeTile(
                              name: "Espresso Coffee",
                              imagepath: 'assets/images/Mocha.jpg',
                              price: "30.00",
                            ),

                            CoffeeTile(
                              name: "Espresso Coffee",
                              imagepath: 'assets/images/Mocha.jpg',
                              price: "30.00",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // This is the Body Section
            ),
            Padding(
              //This is the Buy Button
              padding: const EdgeInsets.all(0),

              child: OrderButton(price: "30.00"),
            ),
          ],
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  // This is a button to create the back button.
  const BackButton({super.key});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
      ),
    );
  }
}

class BodyTitle extends StatelessWidget {
  // This widget holds the Title of the coffee
  final String title;
  const BodyTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Mocha Coffee",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  final String bodytext;
  const BodyText({super.key, required this.bodytext});

  @override
  Widget build(BuildContext context) {
    return Text(bodytext, style: TextStyle(fontSize: 20));
  }
}

class OrderButton extends StatelessWidget {
  final String price;
  const OrderButton({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Text(
                "Order",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Spacer(flex: 1),
              Text(price, style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
