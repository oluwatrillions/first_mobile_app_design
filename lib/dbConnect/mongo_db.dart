import 'dart:developer';
import 'package:first_app/dbConnect/db_agents.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  // ignore: prefer_typing_uninitialized_variables, strict_top_level_inference
  static var db, userCollection;

  // ignore: strict_top_level_inference
  static connect() async {
    db = await Db.create(MONGO_URI);
    await db.open();
    inspect(db);
    log('Connected to MongoDB');
    userCollection = db.collection(USER_COLLECTION);
  }
}
