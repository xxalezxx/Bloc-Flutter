import 'package:block_flutter/bloc/products_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// create a new instance of the block to bring the information
class MyApp extends StatelessWidget {
  final productsBloc = ProductsBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products (xx)',
      home: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: productsBloc.itemCounter,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(child: Text('${snapshot.data ?? 0}'));
            },
          ),
        ),
        body: StreamBuilder<Object>(
            // Here you can, now, hear the information from the bloc
            stream: productsBloc.getProductos,
            builder: (_, AsyncSnapshot snapshot) {
              // If you have a null return, just put on it a empty []
              final products = snapshot.data ?? [];
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(products[index]),
                  );
                },
              );
            }),
      ),
    );
  }
}
