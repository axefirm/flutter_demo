import 'package:demo_project/product_item_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var products = [];

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  void getHttp() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products');
      print(response);
      setState(() {
        products = response.data['products'];
      });

      print(products);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        // child: Column(
        //   children:
        //       products.map((value) => ProductItemWidget(value: value)).toList(),
        // ),

        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductItemWidget(
              value: products[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 30,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
