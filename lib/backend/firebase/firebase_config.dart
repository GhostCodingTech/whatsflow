import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAO5CH_xhNudl0WeooXrCxbdlCa_9nO9Kw",
            authDomain: "basic-whatsflow.firebaseapp.com",
            projectId: "basic-whatsflow",
            storageBucket: "basic-whatsflow.appspot.com",
            messagingSenderId: "879875876695",
            appId: "1:879875876695:web:63bf6d52160be8706c0012"));
  } else {
    await Firebase.initializeApp();
  }
}
