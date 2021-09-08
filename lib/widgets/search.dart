import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'product_grid.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = '';
  var iconchange = 0;
  final TextEditingController _textController = TextEditingController();

  List submitCounter = List(); // this will save counter data
  // List<String> searchList = [];

  // void _search(searchQuery) async {
  //   searchList.clear();
  //   Firestore.instance
  //       .collection('products')
  //       .where('search', arrayContains: query)
  //       .getDocuments()
  //       .then(
  //         (querySnapshot) => querySnapshot.documents.forEach(
  //           (element) {
  //             print('${element.data['title']} mysearch');
  //             setState(() {
  //               searchList.add(element.data['title']);
  //             });
  //           },
  //         ),
  //       );

  //   List<DocumentSnapshot> documentList = (await Firestore.instance
  //           .collection("products")
  //           // .document(await firestoreProvider.getUid())
  //           // .collection(caseCategory)
  //           .where("search", arrayContains: query)
  //           .getDocuments())
  //       .documents;

  //   for (var i = 0; i < documentList.length; i++) {
  //     print('${documentList[i]['title']} documentList');
  //   }

  //   // print(documentList);
  //   // print('$searchList searchList');

  //   print(searchList);
  //   // setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 3.0,
                bottom: 11.0,
                right: 10.0,
                left: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(hintText: 'Search'),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          query = value.trim();
                          print(query);
                        });
                      },
                    ),
                  ),
                  if (query == '')
                    Icon(
                      Icons.search, //icon
                    ),
                  if (query != '')
                    IconButton(
                        icon: Icon(
                          Icons.cancel,
                        ),
                        onPressed: () {
                          setState(() {
                            _textController.clear();
                            query = '';
                            // _textController.dispose();
                          });
                        })
                ],
              ),
            ),
          ),
          StreamBuilder(
            stream: Firestore.instance
                .collection("products")
                .where("search", arrayContains: query)
                .snapshots(),
            builder: (context, productSnapshot) {
              if (productSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final products = productSnapshot.data.documents;

              return Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.9 / 6,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: products.length,
                  // products.length,
                  itemBuilder: (ctx, index) {
                    if (submitCounter.length < products.length) {
                      submitCounter.add(0);
                      print(submitCounter[index]);
                    }

                    return ProductGrid(
                      title: products[index]['title'],
                      // 'title',
                      imageUrl:
                          // 'https://s3-prod-europe.autonews.com/s3fs-public/styles/width_792/public/Jaguar%20I-Pace%2019%20web.jpg',
                          products[index]['image'],

                      price: products[index]['price'],
                      // '123',
                      //   glomgold: 1,
                      quantity: products[index]['quantity'],
                      count: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.add_circle_outline), //button
                            onPressed: () {},
                          ),
                          Text('${submitCounter[index]}'),
                          //submitCounter[index].toString(),
                          IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () {})
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
