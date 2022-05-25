class ApiUrl {
  // static const apiMainPath = "http://5.189.147.159:9600/";
  static const apiMainPath = "http://192.168.29.218:8080/";
  /// Common API
  static const signInApi = apiMainPath + "API/Login";
  static const forgotPasswordApi = apiMainPath + "API/ForgotPassword";

  /// Customer API
  static const userSignUpApi = apiMainPath + "API/CustomerRegister";
  static const userBusinessListApi = apiMainPath + "Searching/APIBusinesslist";
  static const userProfileApi = apiMainPath + "API/CustomerProfile";


  static const userBusinessDetailsApi = apiMainPath + "Searching/APIBusinessDetails";
  static const userBookingHistoryListApi = apiMainPath + "API/CustomerOrderListIndex";
  static const getReviewApi = apiMainPath + "Reviews/APIShowReview";
  static const userChangePasswordApi = apiMainPath + "API/APIChangePassword";
  static const userAppointmentListApi = apiMainPath + "CustomerDashboard/APICustomerAppointmentlist";
  static const userAddReviewApi = apiMainPath + "Reviews/APIAddUpdateReview";

  /// Customer - Home Screen API
  static const getAllCategoryApi = apiMainPath + "API/APIBusinesstypelist";
  static const getAllUpcomingAppointment = apiMainPath + "API/customerdashboard";
  static const searchVendorApi = apiMainPath + "API/Searchbussinesstype";
  static const upcomingAppointmentDetailsApi = apiMainPath + "API/customerdashboardView";

  /// Cst - Search Filter API
  static const searchFilterApi = apiMainPath + "API/Searchbussinesstype";

  /// Cst - Vendor Details
  static const vendorDetailsApi = apiMainPath + "API/getvendordetails";

  /// Cst - Get Vendor ReviewList
  static const vendorReviewApi = apiMainPath + "API/customerReviewList";
  static const customerGiveReviewApi = apiMainPath + "API/customerAddReview";
  static const vendorBusinessHoursApi = apiMainPath + "API/Vendorworkinghours";

  /// Cst - Booking API
  static const vendorBookingDetailsApi = apiMainPath + "API/BookingVendorDetail";
  static const vendorServicesApi = apiMainPath + "API/BookingServiceByVendorId";
  static const vendorBookingResourcesApi = apiMainPath + "API/GetALLResourceByVendorId";
  static const bookSelectedSlotApi = apiMainPath + "API/AddBookingSchedule";
  static const bookSelectedAvailableTimeSlotApi = apiMainPath + "API/AddBookingScheduleResource";

  /// Cst - Checkout
  static const customerCheckoutApi = apiMainPath + "API/Checkout";
  static const customerCheckoutSummaryApi = apiMainPath + "API/BookingSummary";
  static const checkoutSubmitApi = apiMainPath + "API/CheckoutUpsert";
  static const invoiceDetailsApi = apiMainPath + "API/InvoiceDetails";


  /// Cst - Order List
  static const getAllCustomerOrderList = apiMainPath + "API/customerorderList";
  static const bookingSuccessApi = apiMainPath + "API/BookingSuccess";

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

  /// Vendor - Review
  static const vendorGetAllReviewApi = apiMainPath + "API/APIShowReview";

  /// Vendor - Orders (All Invoice)
  static const vendorGetAllOrdersApi = apiMainPath + "API/InvoiceIndex";
  static const vendorOrderDetailsApi = apiMainPath + "API/InvoiceView";

  /// Vendor - Subscription Plan
  static const vendorSubscriptionPlanApi = apiMainPath + "API/SubscriptionGetAll";

  /// vendor - Available Time
  static const vendorAvailableTimeApi = apiMainPath + "API/AvailableTimingsGetALL";
  static const vendorSetAvailableTimeApi = apiMainPath + "API/AvailableTimingsJson";

  /// Vendor - Appointment List & Details
  static const vendorAppointmentList = apiMainPath + "API/APIAppointmentlist";
  static const vendorAppointmentDetailsApi = apiMainPath + "API/ViewAppointment";
  static const vendorAppointmentStatusChangeApi = apiMainPath + "API/AppointmentAcceptorcancel";


  /// Vendor - Schedule Time
  static const vendorGetAllScheduleSlotApi = apiMainPath + "API/ScheduleTimings";
  static const vendorSetScheduleTimeApi = apiMainPath + "API/ScheduleTimingsUpsertslotJson";
  static const getAllResourcesByVendorIdApi = apiMainPath + "API/GetALLResourceByVendorId";
  static const getResourcesTimeSlotApi  = apiMainPath + "API/BookingResourceSchedule";

  /// Vendor - Customer
  static const vendorMyCustomerApi = apiMainPath + "API/MycustomerIndex";

  static const vendorBusinessTypeApi = apiMainPath + "API/APIBusinesstypelist";
  static const getUserDetailsByIdApi = apiMainPath + "API/GetUserDetailById";

  static const vendorGetAllResourcesApi = apiMainPath + "API/ResourceIndex"; // Get ALL
  static const vendorAddAndUpdateResourcesApi = apiMainPath + "API/ResourceUpsert"; // Add & Update
  static const vendorDeleteResourcesApi = apiMainPath + "API/ResourceDelete"; //delete
  static const vendorGetResourceDetailsApi = apiMainPath + "API/ResourceGetById"; // Get By Id
}