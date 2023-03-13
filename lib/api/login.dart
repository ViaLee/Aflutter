

import 'package:my_flutter/utills/http.dart';

class Api{
  static login(data){
    return Request.post('/login',data:data);
  }

  static register(data){
    return Request.post('/user/create',data:data);
  }
}


