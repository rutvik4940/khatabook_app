import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:khata_app/screen/addentry/model/entry_model.dart';

class EntryHelper
{
  static  EntryHelper helper=EntryHelper._();
 EntryHelper._();

  var db = FirebaseFirestore.instance;

  Future<void> add(entryModel model) async {
    await db.collection("entry").add({
      "name": model.name,
      "qua": model.qua,
      "price": model.price,
      "date": model.date,
      "status": model.status,
      "username":model.username,
      "total":model.total

    });
  }

  Future<List<entryModel>> read() async {
    QuerySnapshot data = await db.collection("entry").get();
    List<QueryDocumentSnapshot<Object?>> data1 = data.docs;
    List<entryModel> model = data1
        .map(
          (e) => entryModel.mapToModel(e.data()! as Map, e.id),
    )
        .toList();
    return model;
  }

  Future<void> update(entryModel model) async {
    await db.collection("entry").doc(model.id).set({
      "name": model.name,
      "qua": model.qua,
      "price": model.price,
      "date": model.date,
      "status": model.status,
      "username":model.username,
      "total":model.total
    });
  }

  Future<void> delete(String dId) async {
    await db.collection("entry").doc(dId).delete();
  }
}