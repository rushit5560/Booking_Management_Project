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

  /// Vendor - Services
  static const vendorAddAndUpdateServiceApi = apiMainPath + "API/ServiceUpsert"; // Add & Update
  static const vendorGetAllServicesApi = apiMainPath + "API/ServiceIndex"; // Get All
  static const vendorGetServiceDetailsApi = apiMainPath + "API/ServiceGetById"; // Get By Id
  static const vendorDeleteServiceApi = apiMainPath + "API/ServiceDelete"; // Delete

  /// Vendor - Additional Slot
  static const vendorGetAllAdditionalSlotApi = apiMainPath + "API/AdditionalSlotIndex"; // Get All
  static const vendorAddAdditionalSlotApi = apiMainPath + "API/AdditionalSlotUpsert"; // Add
  static const vendorUpdateAdditionalSlotApi = apiMainPath + "API/AdditionalSlotUpsert"; // Update
  static const vendorDeleteAdditionalSlotApi = apiMainPath + "API/AdditionalSlotDelete"; // Delete
  static const vendorGetAdditionalDetailsByIdApi = apiMainPath + "API/AdditionalSlotGetById"; // Get By Id

  /// Vendor - Business Documents
  static const vendorGetAllDocumentsApi = apiMainPath + "API/VendorDocumentIndex"; // Get All Doc
  static const vendorAddDocumentsApi = apiMainPath + "API/VendorDocumentAddVerify"; // Add Doc
  static const vendorGetSingleDocumentByIdApi = apiMainPath + "API/VendorDocumentGetById"; // Get Single Doc By Id


  static const vendorBusinessTypeApi = apiMainPath + "API/APIBusinesstypelist";

  static const vendorGetAllResourcesApi = apiMainPath + "API/ResourceIndex"; // Get ALL
  static const vendorAddAndUpdateResourcesApi = apiMainPath + "API/ResourceUpsert"; // Add & Update
  static const vendorDeleteResourcesApi = apiMainPath + "API/ResourceDelete"; //delete
  static const vendorGetResourceDetailsApi = apiMainPath + "API/ResourceGetById"; // Get By Id
}