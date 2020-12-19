import 'package:flutter/material.dart';

class EmptyCartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Currently your cart is empty'),
            const SizedBox(height: 10,),
            const Icon(Icons.shopping_cart, size: 50,)
          ],
        ),
      ),
    );
  }
}
