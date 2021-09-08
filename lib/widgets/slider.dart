import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Slides extends StatelessWidget {
  final PageController ctrl = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
            stream: Firestore.instance.collection('sliders').snapshots(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final slide = snap.data.documents;
              return PageView.builder(
                onPageChanged: (_) {},
                controller: ctrl,
                itemCount: slide.length,
                itemBuilder: (ctx, index) {
                  return Stack(
                    children: <Widget>[
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                      GestureDetector(
                        onTap: () {
                          print(slide[index]);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 0),
                          curve: Curves.easeOutQuint,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(slide[index]['image']),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            });
  }
}
