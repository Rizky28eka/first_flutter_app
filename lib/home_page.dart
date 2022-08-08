import 'package:first_flutter_app/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BANNER
              Container(
                color: Colors.white,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Upgrade your skill\nUpgrade your life",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Image.asset(
                      "images/banner.png",
                      width: 100,
                    )
                  ],
                ),
              ),
              // TEXT BOOK
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Books",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),

              // LIST BOOK
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listBook.length,
                itemBuilder: (context, index) {
                  final book = listBook[index];
                  return GestureDetector(
                    onTap: () {
                      final route = MaterialPageRoute(
                          builder: (context) => DetailPage(book: book));
                      Navigator.push(context, route);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 90,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.1),
                                blurRadius: 6.0)
                          ]),
                      child: Row(
                        children: [
                          Image.asset(
                            book.image,
                            width: 64,
                            height: 64,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.name,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                book.categoryBook,
                                style: const TextStyle(fontSize: 20),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
