import 'user_details.dart';

class ApiHeader {
  Map<String, String> headers = <String, String>{
    'Authorization': "Bearer ${UserDetails.apiToken}",
  };
}

// {
// "Accept": "application/json",
// "Accept": "application/json",
// "content-type":"application/json"
// }
// "content-type":"multipart/form-data"
