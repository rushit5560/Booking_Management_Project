import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../controllers/vendor_appointment_list_screen_controller/vendor_appointment_list_screen_controller.dart';
import '../appointment_details_screen/appointment_details_screen.dart';

class AppointmentListSearchAppointmentField extends StatelessWidget {
  AppointmentListSearchAppointmentField({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

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

/// Filter List Module
class AppointmentListTextModule extends StatelessWidget {
  AppointmentListTextModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Appointment List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 25),
        _selectableTabsModule(),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _selectableTabsModule() {
    return SizedBox(
      height: Get.height / 23,
      child: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 3),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'All',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 1
                                ? Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: Container(
                                      height: 6,
                                      width: 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Pending',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 2
                                ? Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: Container(
                                      height: 6,
                                      width: 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Confirm',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 3
                                ? Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: Container(
                                      height: 6,
                                      width: 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 4
                                ? Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: Container(
                                      height: 6,
                                      width: 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Done',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 5
                                ? Padding(
                                    padding: const EdgeInsets.all(1.5),
                                    child: Container(
                                      height: 6,
                                      width: 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Processing',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 6
                                ? Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Container(
                                height: 6,
                                width: 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                            )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () => screenController.selectedTabIndex.value = 7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                            'Scheduled',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 11,
                            width: 11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black)),
                            child: screenController.selectedTabIndex.value == 7
                                ? Padding(
                              padding: const EdgeInsets.all(1.5),
                              child: Container(
                                height: 6,
                                width: 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                            )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 3),
              ],
            ),
          );
        },
      ),
    );
  }
}


/// All Appointment List
class AllAppointmentListModule extends StatelessWidget {
  AllAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.allAppointmentList.isEmpty
        ? const Center(child: Text("No All Appointment List"))
        : ListView.builder(
            itemCount: screenController.allAppointmentList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(
                    bottom: 17, left: 5, right: 5, top: 5),
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
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _viewButton(i),
                          // const SizedBox(width: 10),
                          // _confirmButton(i),
                        ],
                      ),
                    ),
                  ],
                ).commonAllSidePadding(10),
              );
            },
          ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.allAppointmentList[i].customer.userName,
      style: const TextStyle(
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
          screenController.allAppointmentList[i].startDateTime,
          style: const TextStyle(fontSize: 9),
        ),

        /*const SizedBox(width: 10),

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
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.allAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () => Get.to(
        ()=> AppointmentDetailsScreen(),
        transition: Transition.zoom,
        arguments: screenController.allAppointmentList[i].id,
      ),
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

  /*Widget _confirmButton(i) {
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
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          screenController.allAppointmentList[i].status,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }*/
}

/// Pending Appointment Module
class PendingAppointmentListModule extends StatelessWidget {
  PendingAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.pendingAppointmentList.isEmpty
        ? const Center(child: Text("No Pending Appointment List"))
        : ListView.builder(
      itemCount: screenController.pendingAppointmentList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.only(
              bottom: 17, left: 5, right: 5, top: 5),
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
              const SizedBox(width: 5),
              Expanded(
                flex: 30,
                child: Row(
                  children: [
                    _viewButton(i),
                    const SizedBox(width: 10),
                    _confirmButton(),
                  ],
                ),
              ),
            ],
          ).commonAllSidePadding(10),
        );
      },
    ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.pendingAppointmentList[i].customer.userName,
      style: const TextStyle(
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
          screenController.pendingAppointmentList[i].customer.dateOfBirth,
          style: const TextStyle(fontSize: 9),
        ),

        /*const SizedBox(width: 10),

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
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.pendingAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () =>
          Get.to(
                  () => AppointmentDetailsScreen(),
              transition: Transition.zoom,
            arguments: screenController.pendingAppointmentList[i].id
          ),
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

/// Confirm Appointment Module
class ConfirmAppointmentListModule extends StatelessWidget {
  ConfirmAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.confirmAppointmentList.isEmpty
        ? const Center(child: Text("No Confirm Appointment List"))
        : ListView.builder(
      itemCount: screenController.confirmAppointmentList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.only(
              bottom: 17, left: 5, right: 5, top: 5),
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
              const SizedBox(width: 5),
              Expanded(
                flex: 30,
                child: Row(
                  children: [
                    _viewButton(i),
                    // const SizedBox(width: 10),
                    // _confirmButton(),
                  ],
                ),
              ),
            ],
          ).commonAllSidePadding(10),
        );
      },
    ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.confirmAppointmentList[i].customer.userName,
      style: const TextStyle(
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
          screenController.confirmAppointmentList[i].customer.dateOfBirth,
          style: const TextStyle(fontSize: 9),
        ),

        /*const SizedBox(width: 10),

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
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.confirmAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () =>
          Get.to(
                  () => AppointmentDetailsScreen(),
              transition: Transition.zoom,
              arguments: screenController.pendingAppointmentList[i].id
          ),
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

/// Cancel Appointment Module
class CancelAppointmentListModule extends StatelessWidget {
  CancelAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.cancelAppointmentList.isEmpty
        ? const Center(child: Text("No Cancel Appointment List"))
        : ListView.builder(
      itemCount: screenController.cancelAppointmentList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.only(
              bottom: 17, left: 5, right: 5, top: 5),
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
              const SizedBox(width: 5),
              Expanded(
                flex: 30,
                child: Row(
                  children: [
                    _viewButton(i),
                    // const SizedBox(width: 10),
                    // _confirmButton(),
                  ],
                ),
              ),
            ],
          ).commonAllSidePadding(10),
        );
      },
    ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.cancelAppointmentList[i].customer.userName,
      style: const TextStyle(
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
          screenController.cancelAppointmentList[i].customer.dateOfBirth,
          style: const TextStyle(fontSize: 9),
        ),

        /*const SizedBox(width: 10),

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
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.cancelAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () =>
          Get.to(
                  () => AppointmentDetailsScreen(),
              transition: Transition.zoom,
              arguments: screenController.pendingAppointmentList[i].id
          ),
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

/// Done Appointment Module
class DoneAppointmentListModule extends StatelessWidget {
  DoneAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.doneAppointmentList.isEmpty
        ? const Center(child: Text("No Done Appointment List"))
        : ListView.builder(
      itemCount: screenController.doneAppointmentList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.only(
              bottom: 17, left: 5, right: 5, top: 5),
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
              const SizedBox(width: 5),
              Expanded(
                flex: 30,
                child: Row(
                  children: [
                    _viewButton(i),
                    // const SizedBox(width: 10),
                    // _confirmButton(),
                  ],
                ),
              ),
            ],
          ).commonAllSidePadding(10),
        );
      },
    ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.doneAppointmentList[i].customer.userName,
      style: const TextStyle(
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
          screenController.doneAppointmentList[i].customer.dateOfBirth,
          style: const TextStyle(fontSize: 9),
        ),

        /*const SizedBox(width: 10),

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
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.doneAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () =>
          Get.to(
                  () => AppointmentDetailsScreen(),
              transition: Transition.zoom,
              arguments: screenController.pendingAppointmentList[i].id
          ),
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

/// Processing Appointment Module
class ProcessingAppointmentListModule extends StatelessWidget {
  ProcessingAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.processingAppointmentList.isEmpty
        ? const Center(child: Text("No Processing Appointment List"))
        : ListView.builder(
      itemCount: screenController.processingAppointmentList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.only(
              bottom: 17, left: 5, right: 5, top: 5),
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
              const SizedBox(width: 5),
              Expanded(
                flex: 30,
                child: Row(
                  children: [
                    _viewButton(i),
                    // const SizedBox(width: 10),
                    // _confirmButton(),
                  ],
                ),
              ),
            ],
          ).commonAllSidePadding(10),
        );
      },
    ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.processingAppointmentList[i].customer.userName,
      style: const TextStyle(
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
          screenController.processingAppointmentList[i].customer.dateOfBirth,
          style: const TextStyle(fontSize: 9),
        ),

        /*const SizedBox(width: 10),

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
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.processingAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () =>
          Get.to(
                  () => AppointmentDetailsScreen(),
              transition: Transition.zoom,
              arguments: screenController.pendingAppointmentList[i].id
          ),
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

/// Schedule Appointment Module
class ScheduledAppointmentListModule extends StatelessWidget {
  ScheduledAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.scheduledAppointmentList.isEmpty
        ? const Center(child: Text("No Scheduled Appointment List"))
        : ListView.builder(
      itemCount: screenController.scheduledAppointmentList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.only(
              bottom: 17, left: 5, right: 5, top: 5),
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
              const SizedBox(width: 5),
              Expanded(
                flex: 30,
                child: Row(
                  children: [
                    _viewButton(i),
                    // const SizedBox(width: 10),
                    // _confirmButton(),
                  ],
                ),
              ),
            ],
          ).commonAllSidePadding(10),
        );
      },
    ).commonSymmetricPadding(horizontal: 15);
  }

  // Widget _userImageModule(i) {
  //   /*return Container(
  //     height: 65,
  //     width: 65,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       image: DecorationImage(
  //         image: AssetImage(image),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );*/
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10),
  //     //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
  //     child: Image.asset(AppImages.vendorImg, scale: 15,),
  //   );
  // }

  Widget _userNameModule(i) {
    return Text(
      screenController.scheduledAppointmentList[i].customer.userName,
      style: const TextStyle(
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
          screenController.scheduledAppointmentList[i].customer.dateOfBirth,
          style: const TextStyle(fontSize: 9),
        ),

        /*const SizedBox(width: 10),

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
        ),*/
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.scheduledAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton(i) {
    return GestureDetector(
      onTap: () =>
          Get.to(
                  () => AppointmentDetailsScreen(),
              transition: Transition.zoom,
              arguments: screenController.pendingAppointmentList[i].id
          ),
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





/*class VendorPendingAppointmentListModule extends StatelessWidget {
  VendorPendingAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  //final int count;
  //const VendorPendingAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.pendingList.isEmpty
        ? const Center(child: Text("No Pending Appointment List"))
        : ListView.builder(
            itemCount: screenController.pendingList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.only(bottom: 17, left: 5, right: 5, top: 5),
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
          ).commonSymmetricPadding(horizontal: 15);
  }

  Widget _userImageModule(i) {
    *//*return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );*//*

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      //child: Image.network(ApiUrl.apiMainPath + screenController.pendingList[i].customerBooking.image),
      child: Image.asset(
        AppImages.vendorImg,
        scale: 15,
      ),
    );
  }

  Widget _userNameModule(i) {
    return Text(
      screenController.pendingList[i].customerBooking.userName,
      style: const TextStyle(
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
          screenController.pendingList[i].customerBooking.dateOfBirth
              .toString(),
          style: const TextStyle(fontSize: 9),
        ),

        *//*const SizedBox(width: 10),

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
        ),*//*
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.pendingList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton() {
    return GestureDetector(
      onTap: () =>
          Get.to(() => VendorUserDetailsScreen(), transition: Transition.zoom),
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
}*/

/*class ConfirmAppointmentListModule extends StatelessWidget {
  ConfirmAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  // final int count;
  // const ConfirmAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.confirmList.isEmpty
        ? const Center(child: Text("No Confirm Appointment List"))
        : ListView.builder(
            itemCount: screenController.confirmList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.only(bottom: 17, left: 5, right: 5, top: 5),
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
          ).commonSymmetricPadding(horizontal: 15);
  }

  Widget _userImageModule(i) {
    *//* return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );*//*
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      // child: Image.network(ApiUrl.apiMainPath + screenController.confirmList[i].customerBooking.image),
      child: Image.asset(
        AppImages.vendorImg,
        scale: 15,
      ),
    );
  }

  Widget _userNameModule(i) {
    return Text(
      screenController.confirmList[i].customerBooking.userName,
      style: const TextStyle(
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
          screenController.confirmList[i].customerBooking.dateOfBirth
              .toString(),
          style: const TextStyle(fontSize: 9),
        ),

        *//*const SizedBox(width: 10),

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
        ),*//*
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.confirmList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton() {
    return GestureDetector(
      onTap: () =>
          Get.to(() => VendorUserDetailsScreen(), transition: Transition.zoom),
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
}*/

/*class CancelAppointmentListModule extends StatelessWidget {
  CancelAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          margin: EdgeInsets.only(bottom: 17, left: 5, right: 5, top: 5),
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
    ).commonSymmetricPadding(horizontal: 15);
  }

  Widget _userNameModule(i) {
    return Text(
      "Ipsum lorem",
      style: const TextStyle(
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
        const Text(
          "2001-12-01 00:00:00:0000",
          style: TextStyle(fontSize: 9),
        ),

        *//*const SizedBox(width: 10),

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
        ),*//*
      ],
    );
  }

  Widget _statusModule(i) {
    return const Text(
      "Status - Cancel",
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton() {
    return GestureDetector(
      onTap: () =>
          Get.to(() => VendorUserDetailsScreen(), transition: Transition.zoom),
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
}*/

/*class DoneAppointmentListModule extends StatelessWidget {
  // final int count;
  // const DoneAppointmentListModule({Key? key, required this.count}) : super(key: key);
  final screenController = Get.find<VendorAppointmentListScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.doneList.isEmpty
        ? const Center(child: Text("No Done Appointment List"))
        : ListView.builder(
            itemCount: screenController.doneList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.only(bottom: 17, left: 5, right: 5, top: 5),
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
          ).commonSymmetricPadding(horizontal: 15);
  }

  Widget _userImageModule(i) {
    *//*return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );*//*

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      // child: Image.network(ApiUrl.apiMainPath + screenController.doneList[i].customerBooking.image),
      child: Image.asset(
        AppImages.vendorImg,
        scale: 15,
      ),
    );
  }

  Widget _userNameModule(i) {
    return Text(
      screenController.doneList[i].customerBooking.userName,
      style: const TextStyle(
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
          screenController.doneList[i].customerBooking.dateOfBirth.toString(),
          style: const TextStyle(fontSize: 9),
        ),

        *//* const SizedBox(width: 10),

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
        ),*//*
      ],
    );
  }

  Widget _statusModule(i) {
    return Text(
      "Status - " + screenController.doneList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _viewButton() {
    return GestureDetector(
      onTap: () =>
          Get.to(() => VendorUserDetailsScreen(), transition: Transition.zoom),
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
}*/
