import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_admin/models/products.dart';

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
