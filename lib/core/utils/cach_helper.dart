
import 'dart:developer';

import 'package:hive/hive.dart';

class CachHelper {

  static  late dynamic userId ;
  static  late dynamic isAdmin ;
  static  late dynamic token ;

  static init() async{
    userId  = await Hive.openBox('userId');
    isAdmin  = await Hive.openBox('admin');
    token  = await Hive.openBox('token');
    log(" >>>>> >>>> init  called ");

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
    log(" >>>>> >>>> admin delete user id");

    userId.delete('userId');
  }


  static saveIsAdmin({required bool admin}) async {

     userId.put('admin', admin);
    log(" >>>>> >>>> admin saved  $admin");
  }

  static bool? getAdmin()  {
    log(" >>>>> >>>> get admin   ");
    return userId.get('admin');

  }

  static deleteAdmin()async {
    log(" >>>>> >>>> delete admin   ");
    isAdmin.delete('admin');
  }
  static saveToken({required String token}) async {

    userId.put('token', token);
    log(" >>>>> >>>> admin saved  $token");
  }

  static String? getToken()  {
    log(" >>>>> >>>> get token   ");
    return userId.get('token');

  }

  static deleteToken()async {
    log(" >>>>> >>>> delete token   ");
    isAdmin.delete('token');
  }

}