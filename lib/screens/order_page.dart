import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Coffee page")),
      body: SafeArea(
        child: Column(
          // Main parent, It holds the Order button at the top, the Order details and totals at the middle,
          //and the Payment Details at the bottom
          children: [
            Expanded(
              // This is the flexbox for the place your order button at the top
              flex: 1,
              child: SizedBox(
                width: 0.5 * double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Place Your Order"),
                ),
              ),
            ),

            Expanded(
              // This is the middle section listing out the prices, tips and total
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text("Tip: "),
                        Text("0.00"),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                        ),
                        ],
                        ),
                        ),

                        Expanded(
                          child: Row(
                            children: [
                              Text("Items: "),
                              Text("0.00"),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            children: [
                              Text("Total: "),
                              Text("0.00"),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      
                ]
                      //Expanded(child: child)
                    ),
                  ),),
                
              
            

            Expanded(flex: 6, child: Column()),
          
        
     ], ),),);
    
  }
}
