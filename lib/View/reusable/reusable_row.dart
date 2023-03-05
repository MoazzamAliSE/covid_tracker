import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  ReusableRow({super.key, required this.title, required this.value});
  String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider()
        ],
      ),
    );
  }
}
