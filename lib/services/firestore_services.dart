import 'package:emart_app/consts/consts.dart';

class FirestoreServices {
// get users data
  static getUser(uid) {
    return firestore
        .collection(vendorCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //get product
  static getProducts(category) {
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  //newmethod
  static getSubCategoryProducts(title) {
    return firestore
        .collection(productsCollection)
        .where('p_subcategory', isEqualTo: title)
        .snapshots();
  }

//get cart
  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where("added_by", isEqualTo: uid)
        .snapshots();
  }

  //delete doc
  static deleteDocument(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  //get Chats
  static getChatMessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  static getAllOrder() {
    return firestore
        .collection(ordersCollection)
        .where('order_by', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static getWishlists() {
    return firestore
        .collection(productsCollection)
        .where('p_wishlist', arrayContains: currentUser!.uid)
        .snapshots();
  }

  static getAllmessages() {
    return firestore
        .collection(chatsCollection)
        .where('fromId, isEqualTo: currentUser.uid')
        .snapshots();
  }

  static getCounts() async {
    var res = await Future.wait([
      firestore
          .collection(cartCollection)
          .where('added_by', isEqualTo: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      firestore
          .collection(productsCollection)
          .where('p_wishlist', arrayContains: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      firestore
          .collection(ordersCollection)
          .where('order_by', isEqualTo: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      })
    ]);
    return res;
  }

  static allproducts() {
    return firestore.collection(productsCollection).snapshots();
  }

  //
  static getFeaturedProducts() {
    return firestore
        .collection(productsCollection)
        .where('is_featured', isEqualTo: true)
        .get();
  }

  //search

  static searchProducts(title) {
    return firestore
        .collection(productsCollection)
        .where('p_name', isLessThanOrEqualTo: title)
        .get();
  }
}
