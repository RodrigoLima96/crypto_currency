import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  deleteUserPhoto(String photoId, String childName) {
    _storage.ref(childName).child(photoId).delete();
  }

  Future<String> uploadUserImageToStorage(
    String childName,
    Uint8List file,
    String uid,
  ) async {
    Reference ref = _storage.ref().child(childName).child(uid);

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }
}
