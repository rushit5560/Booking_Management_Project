import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_header.dart';
import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../model/home_screen_models/get_favourite_vendor_model.dart';
import '../../model/user_business_details_model/add_vendor_in_favourite_model.dart';

class UserFavouriteListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

   ApiHeader apiHeader = ApiHeader();
  List<FavouriteVendorDetails> favouriteVendorList = [];

  /// Get Favourite Vendor List
  getFavouriteVendorByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.favouriteVendorListApi + "?cutomerid=${UserDetails.tableWiseId}";
    log("Favourite vendor List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      // log("Favourite Vendor Response : ${response.body}");

      GetFavouriteVendorModel getFavouriteVendorModel = GetFavouriteVendorModel.fromJson(json.decode(response.body));
      isSuccessStatus = getFavouriteVendorModel.success.obs;

      if(isSuccessStatus.value) {
        favouriteVendorList.clear();
        favouriteVendorList = getFavouriteVendorModel.data;
         log("favouriteVendorList : ${favouriteVendorList.length}");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getFavouriteVendorByIdFunction Else Else");
      }

    } catch(e) {
      log("getFavouriteVendorByIdFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Add Vendor in Favorite
  addVendorInFavoriteFunction(int vendorId) async {
    // isLoading(true);
    String url = ApiUrl.addFavouriteVendorApi;
    log("Add Vendor in Favourite API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // request.headers.addAll(apiHeader.headers);

      request.fields['VendorId'] = "$vendorId";
      request.fields['CustomerId'] = "${UserDetails.tableWiseId}";

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream.transform(utf8.decoder).listen((value) async {
        AddVendorInFavouriteModel addVendorInFavouriteModel =
        AddVendorInFavouriteModel.fromJson(json.decode(value));
        isSuccessStatus = addVendorInFavouriteModel.success.obs;
        log("Body : ${addVendorInFavouriteModel.statusCode}");

        if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: "Removed from favourite");
        } else {
          Fluttertoast.showToast(msg: "Something went wrong!");
        }
      });
    } catch (e) {
      log("addVendorInFavoriteFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      // isLoading(false);
      await getFavouriteVendorByIdFunction();
    }
  }

  @override
  void onInit() {
    getFavouriteVendorByIdFunction();
    super.onInit();
  }

}