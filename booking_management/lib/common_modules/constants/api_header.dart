import 'user_details.dart';

class ApiHeader {

  Map<String, String> headers = <String,String> {
    'Authorization': UserDetails.apiToken

  };

}

// {
// "Accept": "application/json",
// "content-type":"application/json"
// }
// "content-type":"multipart/form-data"
