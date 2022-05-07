import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
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

                            _userEmailModule(i),
                            const SizedBox(height: 8),

                            _userMobileNoModule(),
                            // const SizedBox(height: 8),
                            // _statusModule(i),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 5),

                //_viewButton(),
              ],
            ).commonAllSidePadding(10),
          );
        });
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

  Widget _userEmailModule(i) {
    return const Text("demotesting0909@gmail.com",
      style: TextStyle(fontSize: 12));
  }

  Widget _userMobileNoModule(){
    return const Text("7875984532",
        style: TextStyle(fontSize: 12));
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

  /*Widget _viewButton() {
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
  }*/
}
