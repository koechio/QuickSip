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
                width: MediaQuery.of(context).size.width * 0.5,
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
                 
                      OrderDetailRow(label:"Tip", value: "5.00", icon: Icons.arrow_back_ios_new),

                       
                        OrderDetailRow(label: "Items", value: "20.00"),

                       
                        OrderDetailRow(label: "Total", value: "25.00"),
                      
                ]
                      //Expanded(child: child)
                    ),
                  ),),
                
              
            

            Expanded(flex: 6, child: Column()),
          
        
     ], ),),);
    
  }
}


class OrderDetailRow extends StatelessWidget {
  /*Creates a widget for the row item and the amount spent it to be for the checkout screen
   Args:
    label: the title of the charge e.g items, tax, tips
    value: the amount charged
    (optional)Icon: To be included at the end, used to make the tip editable

  Returns: a widget for the row item and the amount spent it to be for the checkout screen

  */ 
    final String label;
    final String value;
    final IconData? icon;

    const OrderDetailRow({
    super.key, 
    required this.label, 
    required this.value,
    this.icon});


  @override
  Widget build(BuildContext context) {
    return Expanded(
                    child: Row(
                      children: [
                        Text(
                          "$label: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                          value,
                          style: TextStyle(fontSize: 20),
                          ),
                       SizedBox(
                        width: 48 ,
                        child: icon != null
                        ? IconButton(
                          onPressed: () {},
                          icon: Icon(
                            icon,
                            color: Colors.black,
                          ),
                          
                        ): const SizedBox.shrink(),
                        ),
                        ],
                        ),
                        );
  }
}