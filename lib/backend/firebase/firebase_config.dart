import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCmkVv03u2wdph33GwhXZVltsqBlPl7nOc",
            authDomain: "lalafang-wxe8k8.firebaseapp.com",
            projectId: "lalafang-wxe8k8",
            storageBucket: "lalafang-wxe8k8.firebasestorage.app",
            messagingSenderId: "439083208481",
            appId: "1:439083208481:web:b24de2464f06c1bb217860"));
  } else {
    await Firebase.initializeApp();
  }
}
