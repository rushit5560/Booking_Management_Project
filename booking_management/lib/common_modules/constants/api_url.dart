class ApiUrl {
  static const apiMainPath = "http://5.189.147.159:9600/";
  /// Common API
  static const signInApi = apiMainPath + "API/Login";
  static const forgotPasswordApi = apiMainPath + "API/ForgotPassword";

  /// User API
  static const userSignUpApi = apiMainPath + "API/CustomerRegister";
  static const userBusinessListApi = apiMainPath + "Searching/APIBusinesslist";
  static const userProfileApi = apiMainPath + "API/CustomerProfile";


  static const userBusinessDetailsApi = apiMainPath + "Searching/APIBusinessDetails";
  static const userBookingHistoryApi = apiMainPath + "Booking/APIBookingHistory";
  static const getReviewApi = apiMainPath + "Reviews/APIShowReview";
  static const userChangePasswordApi = apiMainPath + "API/APIChangePassword";
  static const userAppointmentListApi = apiMainPath + "CustomerDashboard/APICustomerAppointmentlist";
  static const userAddReviewApi = apiMainPath + "Reviews/APIAddUpdateReview";

  /// Vendor API
  static const vendorSignUpApi = apiMainPath + "API/VendorRegister";
  static const vendorPendingAppointmentApi = apiMainPath + "Appointments/APIAppointmentPending";
  static const vendorAllAppointmentApi = apiMainPath + "Appointments/APIAppointmentGetALL";
  static const vendorConfirmAppointmentApi = apiMainPath + "Appointments/APIAppointmentConfirm";
  static const vendorDoneAppointmentApi = apiMainPath + "Appointments/APIAppointmentDone";
  static const vendorEditProfileApi = apiMainPath + "API/VendorProfile";

  static const vendorAddAndUpdateServiceApi = apiMainPath + "API/ServiceUpsert";
  static const vendorGetAllResourcesApi = apiMainPath + "API/ServiceIndex";
  static const vendorGetServiceDetailsApi = apiMainPath + "API/ResourceGetById";
  static const vendorDeleteServiceApi = apiMainPath + "API/ServiceDelete";
}