
import 'package:flutter/material.dart';
import 'package:flutter_application_6/api/api.dart';
import 'package:flutter_application_6/models/user.dart';

class UserProvider extends ChangeNotifier{

  List<User> users = [];
  bool isLoading = false;
  String? errorMessage ;

  Api _api = Api();

  Future<void> fetchUsers() async{
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try{
      users = await _api.getUsers();

    }catch(e){
      errorMessage = e.toString();
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }


}