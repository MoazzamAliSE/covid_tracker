import 'package:covid_tracker/View/reusable/reusable_row.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.totalRecovered,
    required this.test,
  });
  String image;
  String name;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.067),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    ReusableRow(
                      title: "Cases",
                      value: widget.active.toString(),
                    ),
                    ReusableRow(
                      title: "Cases",
                      value: widget.totalCases.toString(),
                    ),
                    ReusableRow(
                      title: "Cases",
                      value: widget.totalCases.toString(),
                    ),
                    ReusableRow(
                      title: "Cases",
                      value: widget.totalCases.toString(),
                    ),
                    ReusableRow(
                      title: "Cases",
                      value: widget.totalCases.toString(),
                    ),
                    ReusableRow(
                      title: "Cases",
                      value: widget.totalCases.toString(),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
