import 'dart:developer';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_appointment_list_screen_controller/user_appointment_list_screen_controller.dart';
import 'package:booking_management/user_side/screens/business_details_screen/business_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/user_appointment_list_model/user_appointment_list_model.dart';



UserAppointmentScreenController screenController = Get.find<UserAppointmentScreenController>();

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

class AppointmentListTextModule extends StatelessWidget {
  const AppointmentListTextModule({Key? key}) : super(key: key);

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
        const SizedBox(height: 30),
        _selectableTabsModule(),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget _selectableTabsModule() {
    return Container(
      height: Get.height/23,
      child: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
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
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                const SizedBox(width: 3),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AllAppointmentListModule extends StatelessWidget {
  const AllAppointmentListModule({Key? key}) : super(key: key);

  //final int count;
  //const AllAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenController.userAppointmentList.isEmpty ?
    const Center(child: Text("No All Appointment List")) :
     ListView.builder(
      itemCount: screenController.userAppointmentList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i){
        Datum datum = screenController.userAppointmentList[i];
        return GestureDetector(
          onTap: (){
            log("id: ${datum.vendorId}");
            Get.to(() => BusinessDetailScreen(), arguments: datum.vendorId);
            //Get.to(() => DetailsScreen());
          },
          child: Container(
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
                  flex: 70,
                  child: Row(
                    children: [
                      _userImageModule(i),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _userNameModule(i),
                          const SizedBox(height: 8),

                          _dateAndTimeModule(i),
                          const SizedBox(height: 8),

                          _statusModule(i),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 5),

                // Expanded(
                //   flex: 30,
                //   child: Row(
                //     children: [
                //       _viewButton(),
                //       const SizedBox(width: 10),
                //       _confirmButton(),
                //     ],
                //   ),
                // ),
              ],
            ).commonAllSidePadding(10),
          ),
        );
      },
    );
  }

  Widget _userImageModule(i) {
    /*return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );*/
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      //child: Image.network(ApiUrl.apiMainPath + screenController.allAppointmentList[i].customerBooking.image),
      child: Image.asset(AppImages.vendorImg, scale: 15,),
    );
  }

  Widget _userNameModule(i) {
    return Text(
      screenController.userAppointmentList[i].customerBooking.userName,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _dateAndTimeModule(/*{required String date, required String time}*/i) {
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
          screenController.userAppointmentList[i].appointmentDate.toString(),
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
      "Status - " + screenController.userAppointmentList[i].status,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Widget _viewButton() {
  //   return GestureDetector(
  //     //onTap: () => Get.to(()=> VendorUserDetailsScreen(), transition: Transition.zoom),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         boxShadow: [
  //           BoxShadow(
  //             spreadRadius: 1,
  //             blurRadius: 2,
  //             color: Colors.grey.shade300,
  //             blurStyle: BlurStyle.outer,
  //           ),
  //         ],
  //       ),
  //       child: const Padding(
  //         padding: EdgeInsets.all(8),
  //         child: Text(
  //           'View',
  //           style: TextStyle(
  //             fontSize: 9,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //
  //     ),
  //   );
  // }

  // Widget _confirmButton() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       boxShadow: [
  //         BoxShadow(
  //           spreadRadius: 1,
  //           blurRadius: 2,
  //           color: Colors.grey.shade300,
  //           blurStyle: BlurStyle.outer,
  //         ),
  //       ],
  //     ),
  //     child: const Padding(
  //       padding: EdgeInsets.all(8),
  //       child: Text(
  //         'Confirm',
  //         style: TextStyle(
  //           fontSize: 9,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //
  //   );
  // }

}

class UserPendingAppointmentListModule extends StatelessWidget {
  const UserPendingAppointmentListModule({Key? key}) : super(key: key);

  //final int count;
  //const VendorPendingAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return screenController.pendingList.isEmpty ?
    const Center(child: Text("No Pending Appointment List")) :*/
    return ListView.builder(
      itemCount: 3,
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
                flex: 70,
                child: Row(
                  children: [
                    _userImageModule(i),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _userNameModule(i),
                        const SizedBox(height: 8),

                        _dateAndTimeModule(i),
                        const SizedBox(height: 8),

                        _statusModule(i),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 5),

              /*Expanded(
                flex: 30,
                child: Row(
                  children: [
                    _viewButton(),
                    const SizedBox(width: 10),
                    _confirmButton(),
                  ],
                ),
              ),*/
            ],
          ).commonAllSidePadding(10),
        );
      },
    );
  }

  Widget _userImageModule(i) {
    /*return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );*/

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      //child: Image.network(ApiUrl.apiMainPath + screenController.pendingList[i].customerBooking.image),
      child: Image.asset(AppImages.vendorImg, scale: 15,),
    );
  }

  Widget _userNameModule(i) {
    return Text(
      "Lorem Ipsum",
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
          "12-01-2021",
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
      "Status - Pending",
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Widget _viewButton() {
  //   return GestureDetector(
  //     //onTap: () => Get.to(()=> VendorUserDetailsScreen(), transition: Transition.zoom),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         boxShadow: [
  //           BoxShadow(
  //             spreadRadius: 1,
  //             blurRadius: 2,
  //             color: Colors.grey.shade300,
  //             blurStyle: BlurStyle.outer,
  //           ),
  //         ],
  //       ),
  //       child: const Padding(
  //         padding: EdgeInsets.all(8),
  //         child: Text(
  //           'View',
  //           style: TextStyle(
  //             fontSize: 9,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //
  //     ),
  //   );
  // }
  //
  // Widget _confirmButton() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       boxShadow: [
  //         BoxShadow(
  //           spreadRadius: 1,
  //           blurRadius: 2,
  //           color: Colors.grey.shade300,
  //           blurStyle: BlurStyle.outer,
  //         ),
  //       ],
  //     ),
  //     child: const Padding(
  //       padding: EdgeInsets.all(8),
  //       child: Text(
  //         'Confirm',
  //         style: TextStyle(
  //           fontSize: 9,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //
  //   );
  // }

}

class ConfirmAppointmentListModule extends StatelessWidget {
  const ConfirmAppointmentListModule({Key? key}) : super(key: key);

  // final int count;
  // const ConfirmAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return screenController.confirmList.isEmpty ?
    // const Center(child: Text("No Confirm Appointment List")) :
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i){
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
                child: Row(
                  children: [
                    _userImageModule(i),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _userNameModule(i),
                        const SizedBox(height: 8),

                        _dateAndTimeModule(i),
                        const SizedBox(height: 8),

                        _statusModule(i),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 5),

             /* Expanded(
                flex: 30,
                child: Row(
                  children: [
                    _viewButton(),
                    const SizedBox(width: 10),
                    _confirmButton(),
                  ],
                ),
              ),*/
            ],
          ).commonAllSidePadding(10),
        );
      },
    );
  }

  Widget _userImageModule(i) {
    /* return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );*/
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      // child: Image.network(ApiUrl.apiMainPath + screenController.confirmList[i].customerBooking.image),
      child: Image.asset(AppImages.vendorImg, scale: 15,),
    );
  }

  Widget _userNameModule(i) {
    return Text(
      "Lorem Ipsum",
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
          "21-02-2021",
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
    return const Text(
      "Status - Confirm",
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Widget _viewButton() {
  //   return GestureDetector(
  //     //onTap: () => Get.to(()=> VendorUserDetailsScreen(), transition: Transition.zoom),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         boxShadow: [
  //           BoxShadow(
  //             spreadRadius: 1,
  //             blurRadius: 2,
  //             color: Colors.grey.shade300,
  //             blurStyle: BlurStyle.outer,
  //           ),
  //         ],
  //       ),
  //       child: const Padding(
  //         padding: EdgeInsets.all(8),
  //         child: Text(
  //           'View',
  //           style: TextStyle(
  //             fontSize: 9,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //
  //     ),
  //   );
  // }
  //
  // Widget _confirmButton() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       boxShadow: [
  //         BoxShadow(
  //           spreadRadius: 1,
  //           blurRadius: 2,
  //           color: Colors.grey.shade300,
  //           blurStyle: BlurStyle.outer,
  //         ),
  //       ],
  //     ),
  //     child: const Padding(
  //       padding: EdgeInsets.all(8),
  //       child: Text(
  //         'Confirm',
  //         style: TextStyle(
  //           fontSize: 9,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //
  //   );
  // }

}

class CancelAppointmentListModule extends StatelessWidget {
  const CancelAppointmentListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i){
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
                child: Row(
                  children: [
                    _userImageModule(i),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _userNameModule(i),
                        const SizedBox(height: 8),

                        _dateAndTimeModule(i),
                        const SizedBox(height: 8),

                        _statusModule(i),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 5),

              /*Expanded(
                flex: 30,
                child: Row(
                  children: [
                    _viewButton(),
                    const SizedBox(width: 10),
                    _confirmButton(),
                  ],
                ),
              ),*/
            ],
          ).commonAllSidePadding(10),
        );
      },
    );
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
  Widget _userImageModule(i) {
    /* return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );*/
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      // child: Image.network(ApiUrl.apiMainPath + screenController.confirmList[i].customerBooking.image),
      child: Image.asset(AppImages.vendorImg, scale: 15,),
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

  // Widget _viewButton() {
  //   return GestureDetector(
  //     //onTap: () => Get.to(()=> VendorUserDetailsScreen(), transition: Transition.zoom),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         boxShadow: [
  //           BoxShadow(
  //             spreadRadius: 1,
  //             blurRadius: 2,
  //             color: Colors.grey.shade300,
  //             blurStyle: BlurStyle.outer,
  //           ),
  //         ],
  //       ),
  //       child: const Padding(
  //         padding: EdgeInsets.all(8),
  //         child: Text(
  //           'View',
  //           style: TextStyle(
  //             fontSize: 9,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //
  //     ),
  //   );
  // }
  //
  // Widget _confirmButton() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       boxShadow: [
  //         BoxShadow(
  //           spreadRadius: 1,
  //           blurRadius: 2,
  //           color: Colors.grey.shade300,
  //           blurStyle: BlurStyle.outer,
  //         ),
  //       ],
  //     ),
  //     child: const Padding(
  //       padding: EdgeInsets.all(8),
  //       child: Text(
  //         'Confirm',
  //         style: TextStyle(
  //           fontSize: 9,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //
  //   );
  // }
}


class DoneAppointmentListModule extends StatelessWidget {
  const DoneAppointmentListModule({Key? key}) : super(key: key);

  // final int count;
  // const DoneAppointmentListModule({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return screenController.doneList.isEmpty ?
    // const Center(child: Text("No Done Appointment List")) :
    return ListView.builder(
      itemCount: 7,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i){
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
                child: Row(
                  children: [
                    _userImageModule(i),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _userNameModule(i),
                        const SizedBox(height: 8),

                        _dateAndTimeModule(i),
                        const SizedBox(height: 8),

                        _statusModule(i),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 5),

              /*Expanded(
                flex: 30,
                child: Row(
                  children: [
                    _viewButton(),
                    const SizedBox(width: 10),
                    _confirmButton(),
                  ],
                ),
              ),*/
            ],
          ).commonAllSidePadding(10),
        );
      },
    );
  }

  Widget _userImageModule(i) {
    /*return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );*/

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      // child: Image.network(ApiUrl.apiMainPath + screenController.doneList[i].customerBooking.image),
      child: Image.asset(AppImages.vendorImg, scale: 15,),
    );
  }

  Widget _userNameModule(i) {
    return Text(
      "Lorem Ipsum",
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
          "25-3-2022",
          style: const TextStyle(fontSize: 9),
        ),

        /* const SizedBox(width: 10),

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
      "Status - Done",
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Widget _viewButton() {
  //   return GestureDetector(
  //     //onTap: () => Get.to(()=> VendorUserDetailsScreen(), transition: Transition.zoom),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         boxShadow: [
  //           BoxShadow(
  //             spreadRadius: 1,
  //             blurRadius: 2,
  //             color: Colors.grey.shade300,
  //             blurStyle: BlurStyle.outer,
  //           ),
  //         ],
  //       ),
  //       child: const Padding(
  //         padding: EdgeInsets.all(8),
  //         child: Text(
  //           'View',
  //           style: TextStyle(
  //             fontSize: 9,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //
  //     ),
  //   );
  // }
  //
  // Widget _confirmButton() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       boxShadow: [
  //         BoxShadow(
  //           spreadRadius: 1,
  //           blurRadius: 2,
  //           color: Colors.grey.shade300,
  //           blurStyle: BlurStyle.outer,
  //         ),
  //       ],
  //     ),
  //     child: const Padding(
  //       padding: EdgeInsets.all(8),
  //       child: Text(
  //         'Confirm',
  //         style: TextStyle(
  //           fontSize: 9,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //
  //   );
  // }

}