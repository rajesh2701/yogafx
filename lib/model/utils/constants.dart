// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:yogafx/controller/controller.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
AppController appController = AppController.instance;
AuthController authController = AuthController.instance;
final Future<FirebaseApp> firebaseInitilization =
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
