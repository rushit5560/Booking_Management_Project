import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/api_header.dart';
import '../../model/business_document_screen_models/add_business_document_model.dart';
import '../../model/business_document_screen_models/get_all_business_documents_model.dart';

class VendorBusinessDocumentScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<DocumentWorkerList> businessDocumentList = [];
  File? file;

  

  /// Add Doc Fields
  RxString selectedDocTypeValue = "Attach photo identification".obs;
  List<String> docTypeList = [
    "Attach photo identification",
    "Attach proof of address"
  ];

  /// Get All Doc
  getAllBusinessDocumentsByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorGetAllDocumentsApi +
        "?VendorId=${UserDetails.tableWiseId}";
    log("Get All Doc API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("All Doc Response : ${response.body}");

      GetAllBusinessDocumentsModel getAllBusinessDocumentsModel =
          GetAllBusinessDocumentsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllBusinessDocumentsModel.success.obs;

      if (isSuccessStatus.value) {
        businessDocumentList.clear();

        businessDocumentList = getAllBusinessDocumentsModel.workerList;
        log("businessDocumentList : ${businessDocumentList.length}");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getAllBusinessDocumentsByIdFunction Else Else");
      }
    } catch (e) {
      log("getAllBusinessDocumentsByIdFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Add Doc
  addBusinessDocumentFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAddDocumentsApi;
    log("Add Business Doc API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      var stream = http.ByteStream(file!.openRead());
      stream.cast();
      var length = await file!.length();

      request.files
          .add(await http.MultipartFile.fromPath("DocumentPath", file!.path));

      request.headers.addAll(apiHeader.headers);

      request.fields['VendorId'] = UserDetails.tableWiseId.toString();
      request.fields['DocumentType'] = selectedDocTypeValue.value;

      var multiPart = http.MultipartFile(
        'DocumentPath',
        stream,
        length,
      );
      request.files.add(multiPart);

      log("request.files: ${request.files}");
      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        AddBusinessDocumentsModel addBusinessDocumentsModel =
            AddBusinessDocumentsModel.fromJson(json.decode(value));
        isSuccessStatus = addBusinessDocumentsModel.success.obs;
        log("Body : ${addBusinessDocumentsModel.statusCode}");
        log("Body : ${addBusinessDocumentsModel.message}");

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addBusinessDocumentsModel.message);
          selectedDocTypeValue.value = "Attach photo identification";
          file!.delete();
          await getAllBusinessDocumentsByIdFunction();
          Get.back();
        } else {
          log("addBusinessDocumentFunction Else Else");
          Fluttertoast.showToast(msg: "Something went wrong!");
        }
      });
    } catch (e) {
      log("addBusinessDocumentFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllBusinessDocumentsByIdFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
