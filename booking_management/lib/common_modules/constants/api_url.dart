class ApiUrl {
  static const apiMainPath = "http://5.189.147.159:9600/";
  // Common API
  static const signInApi = apiMainPath + "Login/Login";
  static const forgotPasswordApi = apiMainPath + "Login/ForgotPassword";

  // User API
  static const userSignUpApi = apiMainPath + "Login/CustomerRegister";
  static const userBusinessListApi = apiMainPath + "Searching/APIBusinesslist";
  static const userBusinessDetailsApi = apiMainPath + "Searching/APIBusinessDetails";
  static const userBookingHistoryApi = apiMainPath + "Booking/APIBookingHistory";
  static const getReviewApi = apiMainPath + "Reviews/APIShowReview";
  static const userChangePasswordApi = apiMainPath + "ChangePassword/APIChangePassword";
  static const userAppointmentListApi = apiMainPath + "CustomerDashboard/APICustomerAppointmentlist";
  static const userAddReviewApi = apiMainPath + "Reviews/APIAddUpdateReview";

  // Vendor API
  static const vendorSignUpApi = apiMainPath + "Login/VendorRegister";
  static const vendorPendingAppointmentApi = apiMainPath + "Appointments/APIAppointmentPending";
  static const vendorAllAppointmentApi = apiMainPath + "Appointments/APIAppointmentGetALL";
  static const vendorConfirmAppointmentApi = apiMainPath + "Appointments/APIAppointmentConfirm";
  static const vendorDoneAppointmentApi = apiMainPath + "Appointments/APIAppointmentDone";
}