import 'package:aircraft_iff/models/aircraft.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference aircraftID =
      Firestore.instance.collection('aircraft');
  Future updateUserData(
    String pt_17,
    String f_18,
    String b757,
  ) async {
    return await aircraftID.document(uid).setData({
      'pt_17': pt_17,
      'f_18': f_18,
      'b757': b757,
    });
  }

  //Aircraft Type from snapshot
  List<AircraftType> _AircraftTypeFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return AircraftType(
        pt_17: doc.data['pt_17'] ?? '',
        f_18: doc.data['f_18'] ?? '',
        b_757: doc.data['b757'] ?? '',
      );
    }).toList();
  }

  //get aircraft stream
  Stream<List<AircraftType>> get aircraft {
    return aircraftID.snapshots().map(_AircraftTypeFromSnapshot);
  }
}
