import 'user_details.dart';

class ApiHeader {

  Map<String, String> headers = <String,String>{
    'Authorization': UserDetails.apiToken
  };

}

