import 'dart:html';
import '../values/constants.dart';

// This helper class resolves the URL to a resource in Firebase Cloud Storage to be able to retrieve it.
// An example is in order. Let's encode this url to a Firebase Cloud Storage resource,
// https://firebasestorage.googleapis.com/v0/b/midevfest.appspot.com/o/images%2Fpartners%2Farbormoonlogo-full.png?alt=media
//
// The inputs to the getCloudStorageURL method would be,
// bucketName = midevfest
// relativePath = images/partners/arbormoonlogo-full.png
//
// The output would append this to the rest of the Firebase Cloud Storage URL
// and URL encode the proper parts to result in:
// https://firebasestorage.googleapis.com/v0/b/midevfest.appspot.com/o/images%2Fpartners%2Farbormoonlogo-full.png?alt=media

class FirebaseCloudStorageURLResolver {
  String getCloudStorageURL(String bucketName, String relativePath) {
    return Constants.readJsonDataLocally ? relativePath : ('https://firebasestorage.googleapis.com/v0/b/' +
        bucketName +
        '.appspot.com/o/' +
        Uri.encodeComponent(relativePath) +
        '?alt=media');
  }
}
