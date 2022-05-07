import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/vendor_user_details_screen/vendor_user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/vendor_home_screen_controller/vendor_home_screen_controller.dart';

VendorHomeScreenController screenController = Get.find<VendorHomeScreenController>();


class SearchAppointmentField extends StatelessWidget {
  const SearchAppointmentField({Key? key}) : super(key: key);

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
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
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
  const PendingListTextModule({Key? key}) : super(key: key);

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
  const TodayAppointmentListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*screenController.pendingList.isEmpty ?
     const Center(child: Text("No Today Appointment List"),) :*/
    ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i){
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
                    _userImageModule(i),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _userNameModule(i),
                          const SizedBox(height: 8),

                          _dateAndTimeModule(i),
                          const SizedBox(height: 8),

                          _statusModule(i),
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
      },
    );
  }

  Widget _userImageModule(i) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      //child: Image.network(ApiUrl.apiMainPath + screenController.pendingList[i].customerBooking.image),
      child: Image.asset(AppImages.vendorImg, scale: 15,),
    );
  }

  Widget _userNameModule(i) {
    return const Text(
      "Lorem Ipsum",
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _dateAndTimeModule(i) {
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
          "23-5-2022 12:22:34",
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

  Widget _statusModule(i) {
    return const Text(
      "Status - Pending",
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton() {
    return GestureDetector(
      onTap: () => Get.to(()=> VendorUserDetailsScreen(), transition: Transition.zoom),
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

  Widget _confirmButton() {
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
  }

}
