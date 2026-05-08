import 'package:flutter/material.dart';

/*
assembles the full details page for a specific coffee item.
this widget has no side effects and does not mutate state.
wraps textual content in a singlechildscrollview to prevent overflow on smaller screens or with accessibility font scaling.
`coffeedetailspage()`
* parameters:
  * key: optional widget identifier.
* returns:
  * a scaffold widget containing the page structure.
*/
class CoffeeDetailsPage extends StatelessWidget {
  const CoffeeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        /* encloses the entire page layout */
        child: Column(
          children: [
            Expanded(
              /* top section holding the coffee image and back button */
              flex: 5,
              child: Stack(
                children: [
                  ClipRRect(
                    /* applies rounded corners to the bottom of the image */
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
                  const Positioned(
                    top: 15,
                    left: 15,
                    child: CustomBackButton(),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: BodyTitle(title: "Mocha Coffee"),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                /* adds padding around the scrollable body text and horizontal list */
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const BodyText(
                        bodytext:
                            "Indulge in the perfect harmony of rich, velvety chocolate and bold, full-bodied espresso with our signature Mocha. Crafted from freshly roasted, ethically sourced Arabica beans, this classic favorite is carefully blended with premium dark cocoa and perfectly steamed milk, creating a luxuriously smooth and creamy texture. Topped with a generous swirl of house-made whipped cream and a light dusting of cocoa powder, every single sip offers a comforting balance of sweet and bittersweet flavors. Whether you need a strong morning pick-me-up to start your day or a cozy afternoon treat to unwind, our Mocha is designed to warm your soul and satisfy your sweet tooth. Experience the ultimate chocolate-coffee bliss.",
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        /* horizontal scrollable section for related coffee tiles */
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CoffeeTile(
                              name: "Espresso Coffee",
                              imagepath: 'assets/images/Mocha.jpg',
                              price: "30.00",
                            ),
                            CoffeeTile(
                              name: "Americano",
                              imagepath: 'assets/images/Mocha.jpg',
                              price: "25.00",
                            ),
                            CoffeeTile(
                              name: "Latte",
                              imagepath: 'assets/images/Mocha.jpg',
                              price: "35.00",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.zero,
              child: OrderButton(price: "30.00"),
            ),
          ],
        ),
      ),
    );
  }
}

/*
creates a circular back navigation button.
this widget does not modify internal state but will trigger a pop event on the navigation stack when pressed.
if the navigation stack is empty, pressing it will result in no action depending on the router implementation.
`custombackbutton()`
* parameters:
  * key: optional widget key.
* returns:
  * a circleavatar containing an iconbutton.
*/
class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        onPressed: () {
          /* logic to navigate back */
        },
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
      ),
    );
  }
}

/*
renders the primary title for the coffee details.
no state modification or side effects occur within this widget.
automatically centers the text and will wrap to a new line if constrained by horizontal screen width.
`bodytitle(title: "mocha coffee")`
* parameters:
  * title: the string to display as the title.
  * key: optional widget key.
* returns:
  * a center widget wrapping stylized text.
*/
class BodyTitle extends StatelessWidget {
  final String title;
  
  const BodyTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}

/*
displays the descriptive paragraph for the coffee.
completely stateless and pure presentation.
text will seamlessly wrap based on the boundaries of its parent container.
`bodytext(bodytext: "delicious coffee...")`
* parameters:
  * bodytext: the paragraph string to be displayed.
  * key: optional widget key.
* returns:
  * a text widget with specific font sizing.
*/
class BodyText extends StatelessWidget {
  final String bodytext;
  
  const BodyText({super.key, required this.bodytext});

  @override
  Widget build(BuildContext context) {
    return Text(bodytext, style: const TextStyle(fontSize: 20));
  }
}

/*
generates a wide button for purchasing the displayed item.
no state mutations internally, relies on callback functions for logic.
sizes its width to 60 percent of the screen to maintain visual balance on tablets and phones alike.
`orderbutton(price: "30.00")`
* parameters:
  * price: the string value of the item cost.
  * key: optional widget key.
* returns:
  * an elevatedbutton inside a constrained sizedbox.
*/
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
          onPressed: () {
            /* order logic goes here */
          },
          child: Row(
            children: [
              const Text(
                "Order",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 1),
              Text(price, style: const TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}

/*
a reusable display card for secondary coffee recommendations.
purely presentational with zero state modifications.
applies strict clipping to ensure the image does not bleed past the rounded borders of the container.
`coffeetile(name: "latte", imagepath: "assets/latte.jpg", price: "35.00")`
* parameters:
  * name: title of the coffee variant.
  * imagepath: asset directory path for the thumbnail.
  * price: cost represented as a string.
  * key: optional widget key.
* returns:
  * a fixed-width container holding a vertically stacked image and text layout.
*/
class CoffeeTile extends StatelessWidget {
  final String name;
  final String imagepath;
  final String price;

  const CoffeeTile({
    super.key,
    required this.name,
    required this.imagepath,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagepath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "\$$price",
                    style: TextStyle(color: Colors.brown[700], fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}