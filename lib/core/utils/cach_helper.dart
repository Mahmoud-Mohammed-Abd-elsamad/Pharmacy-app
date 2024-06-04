
import 'dart:developer';

import 'package:hive/hive.dart';

class CachHelper {

  static  late dynamic userId ;
  static  late dynamic isAdmin ;

  static init() async{
    userId  = await Hive.openBox('userId');
    isAdmin  = await Hive.openBox('admin');
    log(" >>>>> >>>> init  userId ");

  }

  static saveUserId({required String id}) async {

    await userId.put('userId', id);
    log(" >>>>> >>>> ID saved ");
  }

  static String? getUserId()  {
    log(" >>>>> >>>> get ID  ");

    return userId.get('userId');

  }

  static deleteUserId() {
    userId.delete('userId');
  }


  static saveIsAdmin({required bool admin}) async {

    await userId.put('admin', admin);
    log(" >>>>> >>>> admin saved  $admin");
  }

  static bool? getAdmin()  {
    log(" >>>>> >>>> get admin   ");
    return userId.get('admin');

  }

  static deleteAmin() {
    isAdmin.delete('admin');
  }
}