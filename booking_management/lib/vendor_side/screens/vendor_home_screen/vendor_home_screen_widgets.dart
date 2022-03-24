import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
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
          'Pending Appointment List',
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


class PendingAppointmentListModule extends StatelessWidget {
  const PendingAppointmentListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i){
        return Container(
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
                flex: 70,
                child: Row(
                  children: [
                    _userImageModule(image: AppImages.vendorImg),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _userNameModule(userName: "Mr. John Doe"),
                          const SizedBox(height: 8),

                          _dateAndTimeModule(date: "22-03-2022", time: "2:00 PM"),
                          const SizedBox(height: 8),

                          _statusModule(status: "Status - Pending"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 5),

              Expanded(
                flex: 30,
                  child: Row(
                    children: [
                      _viewButton(),
                      const SizedBox(width: 10),
                      _confirmButton(),
                    ],
                  ),
              ),
            ],
          ).commonAllSidePadding(10),
        );
      },
    );
  }

  Widget _userImageModule({required String image}) {
    return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _userNameModule({required String userName}) {
    return Text(
      userName,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _dateAndTimeModule({required String date, required String time}) {
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
          date,
          style: const TextStyle(fontSize: 9),
        ),

        const SizedBox(width: 10),

        Image.asset(
          AppImages.timeImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          time,
          style: const TextStyle(fontSize: 9),
        ),
      ],
    );
  }

  Widget _statusModule({required String status}) {
    return Text(
      status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton() {
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
          'View',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
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
