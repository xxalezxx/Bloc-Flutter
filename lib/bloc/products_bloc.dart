import 'dart:async';

const PRODUCTOS = ['keyboard', 'camara', 'microphone', 'screen'];

class ProductsBloc {
// When you have the async, but with the * means the function returns a Stream
// Remember when you have only async without *, means you return a Future
  Stream get getProductos async* {
    final List<String> products = [];
    for (String item in PRODUCTOS) {
      await Future.delayed(Duration(seconds: 2));
      products.add(item);
      // The Yield is very similar than Return, but the differents beetwend is that
      // the Yield sends information to the Stream comunication. So, each time you
      // return something throw the yield, it send to the Stream. Others components
      // like widgets can read it and you can , maybe, refresh the widget.
      yield products;
    }
  }

  StreamController<int> _itemCount = StreamController<int>();
  Stream<int> get itemCounter => _itemCount.stream;

  ProductsBloc() {
    this
        .getProductos
        .listen((porductsList) => this._itemCount.add(porductsList.length));
  }

  dispose() {
    // You need yo close the StreamController when you do not use it.
    _itemCount.close();
  }
}
