import 'package:flutter/material.dart';
import 'package:freshbasketr/widgets/search.dart';
import './widgets/slider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FreshBasketR'),
      ),

      //drawer//

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                    right: 15,
                    left: 15,
                  ),
                  child: Search(),
                ),
              ),
            ),

            SizedBox(
              height: 5,
            ),

            Container(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top * 22.5,
              child: Slides(),
            )

            //categories
          ],
        ),
      ),
    );
  }
}
