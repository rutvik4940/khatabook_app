import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khata_app/screen/home/model/user_model.dart';

class FBHelper {
  static FBHelper helper = FBHelper._();

  FBHelper._();

  var db = FirebaseFirestore.instance;

  Future<void> add(userModel model) async {
    await db.collection("user").add({
      "name": model.name,
      "number": model.number,
      "address": model.address,
      "area": model.area,
      "pincode": model.pincode,
      "city": model.city,
      "state": model.state
    });
  }

  Future<List<userModel>> read() async {
    QuerySnapshot data = await db.collection("user").get();
    List<QueryDocumentSnapshot<Object?>> data1 = data.docs;
    List<userModel> model = data1
        .map(
          (e) => userModel.mapToModel(e.data()! as Map, e.id),
        )
        .toList();
    return model;
  }

  Future<void> update(userModel model) async {
    await db.collection("user").doc(model.id).set({
      "name": model.name,
      "number": model.number,
      "address": model.address,
      "area": model.area,
      "pincode": model.pincode,
      "city": model.city,
      "state": model.state
    });
  }

  Future<void> delete(String dId) async {
    await db.collection("user").doc(dId).delete();
  }
}
