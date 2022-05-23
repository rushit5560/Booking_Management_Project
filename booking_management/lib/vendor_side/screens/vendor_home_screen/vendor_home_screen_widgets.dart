import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/vendor_home_screen_controller/vendor_home_screen_controller.dart';
import '../../model/vendor_appointment_list_screen_models/appointment_list_model.dart';
import '../appointment_details_screen/appointment_details_screen.dart';

/// Header Module
class VendorHeaderModule extends StatelessWidget {
  VendorHeaderModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.15,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: Get.height * 0.15,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.shapeImg),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.07,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.headerLogoImg),
                scale: 0.9,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Icon(
                Icons.menu_rounded,
                color: Colors.grey.shade600,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchAppointmentField extends StatelessWidget {
  SearchAppointmentField({Key? key}) : super(key: key);
  final screenController = Get.find<VendorHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 8,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: TextFormField(
        controller: screenController.searchAppointmentFieldController,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Search Appointment',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class PendingListTextModule extends StatelessWidget {
  PendingListTextModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          'Today Appointment List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}

class TodayAppointmentListModule extends StatelessWidget {
  TodayAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.pendingAppointmentList.isEmpty
        ? const Center(child: Text("No Today Appointment List"))
        : ListView.builder(
            itemCount: screenController.pendingAppointmentList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              AppointmentListModule singleItem = screenController.pendingAppointmentList[i];
              return _pendingListTile(singleItem);
            },
          );
  }

  Widget _pendingListTile(AppointmentListModule singleItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 17, left: 5, right: 5, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            //flex: 68,
            child: Row(
              children: [
                // _userImageModule(singleItem),
                // const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _userNameModule(singleItem),
                      const SizedBox(height: 8),
                      _dateAndTimeModule(singleItem),
                      const SizedBox(height: 8),
                      _statusModule(singleItem),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          _viewButton(),
        ],
      ).commonAllSidePadding(10),
    );
  }

  /*Widget _userImageModule(AppointmentListModule singleItem) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      //child: Image.network(ApiUrl.apiMainPath + screenController.pendingList[i].customerBooking.image),
      child: Image.network(singleItem.customer., scale: 15,),
    );
  }*/

  Widget _userNameModule(AppointmentListModule singleItem) {
    return Text(
      singleItem.customer.userName,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _dateAndTimeModule(AppointmentListModule singleItem) {
    return Row(
      children: [
        Image.asset(
          AppImages.dateImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          singleItem.startDateTime,
          style: const TextStyle(fontSize: 9),
        ),

        // const SizedBox(width: 10),
        //
        // Image.asset(
        //   AppImages.timeImg,
        //   height: 11,
        //   width: 11,
        //   fit: BoxFit.cover,
        // ),
        // const SizedBox(width: 5),
        // Text(
        //   time,
        //   style: const TextStyle(fontSize: 9),
        // ),
      ],
    );
  }

  Widget _statusModule(AppointmentListModule singleItem) {
    return Text(
      "Status - ${singleItem.status}",
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton() {
    return GestureDetector(
      onTap: () => Get.to(() => AppointmentDetailsScreen(),
          transition: Transition.zoom),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'View',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

/*Widget _confirmButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Confirm',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

    );
  }*/

}
