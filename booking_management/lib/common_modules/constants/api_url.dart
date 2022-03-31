class ApiUrl {
  static const apiMainPath = "http://5.189.147.159:9600/";
  // Common API
  static const signInApi = apiMainPath + "Login/Login";
  static const forgotPasswordApi = apiMainPath + "Login/ForgotPassword";

  // User API
  static const userSignUpApi = apiMainPath + "Login/CustomerRegister";
  static const userBusinessListApi = apiMainPath + "Searching/APIBusinesslist";
  static const userBusinessDetailsApi = apiMainPath + "Searching/APIBusinessDetails";

  // Vendor API
  static const vendorSignUpApi = apiMainPath + "Login/VendorRegister";
  static const vendorPendingAppointmentApi = apiMainPath + "Appointments/APIAppointmentPending";
  static const vendorAllAppointmentApi = apiMainPath + "Appointments/APIAppointmentGetALL";
}