import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';
import '../../model/appointment_report_screen_model/appointment_report_model.dart';

class AppointmentReportScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  List<AppointmentListModule> appointmentReportList = [];

  /// For Filter
  RxString startDate = "Select Start Date".obs;
  RxString endDate = "Select End Date".obs;
  RxBool isStartDateCalenderShow = false.obs;
  RxBool isEndDateCalenderShow = false.obs;

  /// DD List
  List<String> statusList = [
    "Select Status",
    "Confirm",
    "Done",
    "Pending",
    "Cancel"
  ];
  RxString selectedStatusValue = "Select Status".obs;

  DateTime selectedStartDate = DateTime.now();

  /// Export Excel
  // Duration? executionTime;

  // Future<void> exportToExcel() async {
  //
  //   final Workbook workbook = WorkBook();
  //   final List<int> bytes = workbook.saveAsStream();
  //   workbook.dispose();
  //
  //   final String path = (await getApplicationSupportDirectory());
  //
  //   /*DateTime dateTime = DateTime.now();
  //   int count = appointmentReportList.length;
  //
  //   final stopWatch = Stopwatch()..start();
  //   var excel = Excel.createExcel();
  //   final sheet = excel[excel.getDefaultSheet()!];
  //
  //
  //   for(var i = 0; i < count; i++) {
  //     sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i)).value = "Flutter";
  //     sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i)).value = "Android";
  //     sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i)).value = "iOS";
  //     sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i)).value = "Cross Platform";
  //   }
  //
  //   excel.save(fileName: "Data_$dateTime.xlsx");
  //
  //   executionTime = stopWatch.elapsed;*/
  // }

  // Future<void> createExcel() async {
  //   log("asdsad");
  //   var res = await Permission.storage.request();
  //
  //   File file = await selectFile(); //this is working fine
  //
  //   //setting some configurations for excel
  //   var bytes = file.readAsBytesSync();
  //   var excel = Excel.decodeBytes(bytes);
  //   Sheet sheetObject = excel['Sheet1'];
  //
  //   //Updating excel values logic
  //   for(int i = 1; i<1000; ++i){
  //     var cell = sheetObject.cell(CellIndex.indexByString("A$i"));
  //     cell.value = 8; // dynamic values support provided;
  //   }
  //
  //   //saving excel
  //   File(join(file.path))
  //     ..createSync(recursive: true)
  //     ..writeAsBytesSync(excel.encode()!);
  //
  //   // final Workbook workbook = Workbook();
  //   // final Worksheet sheet = workbook.worksheets[0];
  //   // sheet.getRangeByName('A1').setText('Hello World!');
  //   // final List<int> bytes = workbook.saveAsStream();
  //   // workbook.dispose();
  //   //
  //   //   final String path = (await getApplicationSupportDirectory()).path;
  //   //   final String fileName = '$path/Output.xlsx';
  //   //   log("fileName: $fileName");
  //   //   final File file = File(fileName);
  //   //   await file.writeAsBytes(bytes, flush: true);
  //     // OpenFile.open(fileName);
  //   // }
  // }

  /// Appointment Report All List
  getAppointmentReportFunction() async {
    isLoading(true);
    String url = selectedStatusValue.value == "Select Status"
        ? ApiUrl.appointmentReportApi + "?userId=${UserDetails.uniqueId}"
        : ApiUrl.appointmentReportApi +
            "?userId=${UserDetails.uniqueId}" +
            "&option=$selectedStatusValue";
    log("Appointment Report Api Url : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Appointment Report Response : ${response.body}");

      AppointmentReportModel appointmentReportModel =
          AppointmentReportModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentReportModel.success.obs;

      if (isSuccessStatus.value) {
        appointmentReportList.clear();

        appointmentReportList = appointmentReportModel.data;
        log("appointmentReportList : ${appointmentReportList.length}");
      } else {
        log("AppointmentReportFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("AppointmentReportFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  /// Filter Appointment Report List
  getFilterAppointmentReportFunction() async {
    isLoading(true);
    String url = selectedStatusValue.value == "Select Status"
        ? ApiUrl.appointmentReportApi +
            "&userId=${UserDetails.uniqueId}" +
            "&fromDate=$startDate" +
            "&toDate=$endDate" /*+ "&option"*/
        : ApiUrl.appointmentReportApi +
            "&userId=${UserDetails.uniqueId}" +
            "&fromDate=$startDate" +
            "&toDate=$endDate" +
            "&option=$selectedStatusValue";

    log("Appointment Report Api Url : $url");
    log('header: ${apiHeader.headers}');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("Appointment Report Response : ${response.body}");

      AppointmentReportModel appointmentReportModel =
          AppointmentReportModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentReportModel.success.obs;

      if (isSuccessStatus.value) {
        appointmentReportList.clear();

        appointmentReportList = appointmentReportModel.data;
        log("FilterAppointmentReportList : ${appointmentReportList.length}");
      } else {
        log("FilterAppointmentReport Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("FilterAppointmentReport Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAppointmentReportFunction();
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
