// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/util/my_button.dart';
import 'package:wallet_app/util/my_card.dart';
import '../util/my_card.dart';
import '../util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //pagecontroller
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //center Button in the bottom navigation bar
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    color: Colors.pink[200],
                    Icons.home,
                    size: 30,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    color: Colors.grey,
                    Icons.settings,
                    size: 30,
                  ),
                  onPressed: () {},
                )
              ]),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // appbar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'My ',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Cards',
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),
                    //plus button
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              //MyCard(),
              //cards
              Container(
                height: 200,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: [
                    MyCard(
                        balance: 5250.20,
                        cardNumber: 12345678,
                        expiryMonth: 10,
                        expiryYear: 24,
                        color: Colors.deepPurple[400]!),
                    MyCard(
                        balance: 342.52,
                        cardNumber: 12365784,
                        expiryMonth: 10,
                        expiryYear: 24,
                        color: Colors.blue[400]!),
                    MyCard(
                        balance: 430.60,
                        cardNumber: 48762235,
                        expiryMonth: 8,
                        expiryYear: 23,
                        color: Colors.green[400]!),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.grey.shade800,
                ),
              ),
              SizedBox(height: 20),

              //3 buttons -> send, pay and bill
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //send button
                    MyButton(
                      buttonText: 'Send',
                      iconImagePath: 'lib/icons/send_money.png',
                    ),
                    MyButton(
                      buttonText: 'Pay',
                      iconImagePath: 'lib/icons/mastercard.png',
                    ),

                    MyButton(
                      buttonText: 'Bills',
                      iconImagePath: 'lib/icons/bill.png',
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              //column -> stats & transactions
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  children: <Widget>[
                    MyListTile(
                      iconImagePath: 'lib/icons/statistics.png',
                      tileTitle: 'Statistics',
                      tileSubTitle: 'Payment and Income',
                    ),
                    MyListTile(
                      iconImagePath: 'lib/icons/transaction.png',
                      tileTitle: 'Transactions',
                      tileSubTitle: 'Transaction History',
                    )
                  ],
                ),
              ),
              //statistics

              //transaction
            ],
          ),
        ),
      ),
    );
  }
}
