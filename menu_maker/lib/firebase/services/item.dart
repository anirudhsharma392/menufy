import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menu_maker/firebase/collections.dart';
import 'package:menu_maker/model/item.dart';

class AppointmentApi {
  /// Returns the list of items
  Future<List<ItemModel>?> getAllItems(String partnerID) async {
    QuerySnapshot _response;
    try {
      _response = await Collection.items
          .where('partner_id', isEqualTo: partnerID)
          .get();

      return _response.docs.map<ItemModel>((e) {
        //assigns the respective id first
        Map _temp = e.data() as Map<dynamic, dynamic>;
        _temp['item_id'] = e.id;
        return ItemModel.fromJson(_temp as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

//removes the entire appointment module
// Future<Status?> removeAppointment(String? appointmentId) async {
//   if (appointmentId == null) return Status.failed;
//   try {
//     Status status = Status.success;
//     await Collection.appointments
//         .doc(appointmentId)
//         .delete()
//         .onError((dynamic error, stackTrace) => status = Status.failed);
//     return status;
//   } catch (e) {
//     debugPrint(e.toString());
//     return null;
//   }
// }

//returns stream of upcoming appointments
// Stream<List<AppointmentModel>> listenAppointments(String? salonId,
//     {DateTime? startTime}) {
//   return Collection.appointments
//       .where('salon.id', isEqualTo: salonId)
//       .where("status",
//           whereIn: [AppointmentStatus.active, AppointmentStatus.requested])
//       .where("appointmentStartTime",
//           isGreaterThan: startTime ?? Time().getDate())
//       .snapshots()
//       .map((snapShot) => snapShot.docs.map<AppointmentModel>((e) {
//             Map _temp = e.data() as Map<dynamic, dynamic>;
//             _temp['appointmentId'] = e.id;
//             return AppointmentModel.fromJson(_temp as Map<String, dynamic>);
//           }).toList());
// }

//returns stream of appointments
// returns appointments for a specific day only

  /// returns a specific appointment from appointmentId
// Future<AppointmentModel?> getAppointmentFromId(String? appointmentId) async {
//   try {
//     if (appointmentId != null && appointmentId != "") {
//       final DocumentSnapshot _response =
//           await Collection.appointments.doc(appointmentId).get();
//
//       Map _temp = _response.data() as Map<dynamic, dynamic>;
//
//       _temp['appointmentId'] = _response.id;
//       return AppointmentModel.fromJson(_temp as Map<String, dynamic>);
//     }
//     return null;
//   } catch (e) {
//     debugPrint("error in appointment api");
//     print(e);
//     return null;
//   }
// }

  /// cancels a  appointment

// Future cancelAppointment(String? appointmentId) async {
//   try {
//     if (appointmentId != null) {
//       //updates the existing appointment
//
//       await Collection.appointments.doc(appointmentId).set({
//         "status": AppointmentStatus.cancelled,
//         "updates":
//             FieldValue.arrayUnion([AppointmentUpdates.cancelledBySalon]),
//         "updatedAt": FieldValue.arrayUnion([DateTime.now()])
//       }, SetOptions(merge: true));
//
//       return 1;
//     }
//     return null;
//   } catch (e) {
//     debugPrint(e.toString());
//     return null;
//   }
// }
}
