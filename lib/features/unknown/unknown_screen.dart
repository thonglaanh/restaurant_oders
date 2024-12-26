import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/features/order_floors/widgets/bottom_sheet_order_dish.dart';
import 'package:untitled/shared/models/dish_model.dart';

class UnknownScreen extends StatefulWidget {
  const UnknownScreen({super.key});

  @override
  State<UnknownScreen> createState() => _UnknownScreenState();
}

class _UnknownScreenState extends State<UnknownScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Opps')),
      body: const Column(
        children: [Text('sdfsdfsdsfdssfsdfdss')],
      ),
    );
  }
}
