import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_admin/models/orderz.dart';
import 'package:store_admin/models/products.dart';

const String ORDER_Collection_REF = 'order';
const String PRODUCTS_COLLECTION_REF = 'products';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _productRef;

  DatabaseService() {
    _productRef =
        _firestore.collection(PRODUCTS_COLLECTION_REF).withConverter<Productz>(
            fromFirestore: (snapshots, _) => Productz.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (product, _) => product.toJson());
  }
  Stream<QuerySnapshot> getProduct() {
    return _productRef.snapshots();
  }

  void addProduct(String productTitle, Productz product) async {
    _productRef.add(product);
  }

  void updateProduct(String productid, Productz product) {
    _productRef.doc(productid).update(product.toJson());
  }

  void deleteProduct(String productid) {
    _productRef.doc(productid).delete();
  }
}

class ODatabaseService {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _orderRef;

  ODatabaseService() {
    _orderRef =
        _firestore.collection(ORDER_Collection_REF).withConverter<Orderz>(
            fromFirestore: (snapshots, _) => Orderz.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (order, _) => order.toJson());
  }
  Stream<QuerySnapshot> getOrderz() {
    return _orderRef.snapshots();
  }

  void addOrder(Orderz order) async {
    _orderRef.add(order);
  }

  void updateOrder(String orderid, Orderz order) {
    _orderRef.doc(orderid).update(order.toJson());
  }

  void deleteOrder(String orderId) {
    _orderRef.doc(orderId).delete();
  }
}
