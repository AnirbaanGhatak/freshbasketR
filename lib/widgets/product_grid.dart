import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String price;
  final String quantity;
  final Widget count;

  ProductGrid({
    this.title,
    this.imageUrl,
    this.price,
    this.quantity,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 100),
        child: Stack(
          overflow: Overflow.clip,
          fit: StackFit.loose,
          alignment: Alignment.topCenter,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Positioned(
              top: 40,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Price: $price',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Qty: $quantity',
                                // softWrap: true,
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      count,
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
