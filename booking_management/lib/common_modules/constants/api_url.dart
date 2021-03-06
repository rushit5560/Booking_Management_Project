class ApiUrl {
  static const serverApiKey = "AAAAPMN5_nM:APA91bHk_HS5tqZwzSyV-_2uP8ktyuhl_sp7HwkbFMP9lsiNHhWDvSxW1vvEMJ_skX2m_nHQp4QInHVPQGig9tkugj81_aoimCMY4ke7_2oZvck5cPtrRUFs9jj7jMJ-29HEfXc3_TTa";
  static const googleApiKey = "AIzaSyDKcmqROew5b-45jQbybMpPXpWjiByOutc";

  static const apiMainPath = "https://setdaytime.com.au/";
  static const apiImagePath = "https://setdaytime.com.au/";


  // static const apiMainPath = "http://192.168.0.103:8080/";
  // static const apiImagePath = "http://192.168.0.103:8080/";


  /// Common API
  static const signInApi = apiMainPath + "API/Login";
  static const forgotPasswordApi = apiMainPath + "API/ForgotPassword";
  static const logoApi = apiMainPath + "API/Logo";
  static const getFcmTokenApi = apiMainPath + "API/GetFCM";
  static const saveNotificationApi = apiMainPath + "API/NotificationUpsert";
  static const getNotificationApi = apiMainPath + "API/NotificationGetById";

  /// Customer API
  static const userSignUpApi = apiMainPath + "API/CustomerRegister";
  static const userBusinessListApi = apiMainPath + "Searching/APIBusinesslist";
  static const userProfileApi = apiMainPath + "API/CustomerProfile";


  static const userBusinessDetailsApi = apiMainPath + "Searching/APIBusinessDetails";
  static const userBookingHistoryListApi = apiMainPath + "API/CustomerOrderListIndex";
  static const userBookingHistoryApi = apiMainPath + "API/bookingHistory";
  static const getReviewApi = apiMainPath + "Reviews/APIShowReview";
  static const userChangePasswordApi = apiMainPath + "API/APIChangePassword";
  static const userAppointmentListApi = apiMainPath + "CustomerDashboard/APICustomerAppointmentlist";
  static const userAddReviewApi = apiMainPath + "Reviews/APIAddUpdateReview";

  /// Customer - Home Screen API
  static const getAllCategoryApi = apiMainPath + "API/AvailableCategorieslist";
  static const getAllUpcomingAppointment = apiMainPath + "API/customerdashboard";
  static const searchVendorApi = apiMainPath + "API/Searchbussinesstype";
  static const upcomingAppointmentDetailsApi = apiMainPath + "API/customerdashboardView";

  static const searchApi = apiMainPath + "API/Search";
  static const locationSearchApi = apiMainPath + "API/Location";

  /// Cst - Search Filter API
  static const searchFilterApi = apiMainPath + "API/Searchbussinesstype";
  static const favouriteVendorListApi = apiMainPath + "API/FavouritesVendor";
  static const addFavouriteVendorApi = apiMainPath + "API/Favourites";
  static const getFavVendorApi = apiMainPath + "API/GetFavourites";

  /// Cst - Vendor Details
  static const vendorDetailsApi = apiMainPath + "API/GetVendorDetails";

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

  static const selectedServicesWiseResourceSlotSearchApi = apiMainPath + "API/BookingResourceSchedule";

  /// Cst - Checkout
  static const customerCheckoutApi = apiMainPath + "API/Checkout";
  static const customerCheckoutSummaryApi = apiMainPath + "API/BookingSummary";
  static const checkoutSubmitApi = apiMainPath + "API/CheckoutUpsert";
  static const invoiceDetailsApi = apiMainPath + "API/InvoiceDetails";
  static const getSecretKeyApi = apiMainPath + "API/StripeSettings";
  static const getPaymentIdApi = apiMainPath + "API/Transaction";

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
  static const vendorSaveLatLongApi = apiMainPath + "API/SaveLatitudeLongitude";

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
  static const vendorAppointmentStatusCancelApi = apiMainPath + "API/AppointmentCancel";

  /// Vendor - Schedule Time
  static const vendorGetAllScheduleSlotApi = apiMainPath + "API/ScheduleTimings";
  static const vendorSetScheduleTimeApi = apiMainPath + "API/ScheduleTimingsUpsertslotJson";
  static const getAllResourcesByVendorIdApi = apiMainPath + "API/GetALLResourceByVendorId";
  static const getResourcesTimeSlotApi  = apiMainPath + "API/BookingResourceSchedule";

  /// Vendor - Customer
  static const vendorMyCustomerApi = apiMainPath + "API/MycustomerIndex";

  static const vendorBusinessTypeApi = apiMainPath + "API/AvailableCategorieslist";
  static const getUserDetailsByIdApi = apiMainPath + "API/GetUserDetailById";

  static const vendorGetAllResourcesApi = apiMainPath + "API/ResourceIndex"; // Get ALL
  static const vendorAddAndUpdateResourcesApi = apiMainPath + "API/ResourceUpsert"; // Add & Update
  static const vendorDeleteResourcesApi = apiMainPath + "API/ResourceDelete"; //delete
  static const vendorGetResourceDetailsApi = apiMainPath + "API/ResourceGetById"; // Get By Id

  static const appointmentReportApi = apiMainPath + "API/AppointmentReport";
  static const customerReportApi = apiMainPath + "API/CustomerReport";
  static const invoiceReportApi = apiMainPath + "API/InvoiceReport";
  static const subscriptionReportApi = apiMainPath + "API/SubscriptionReport";

  /// Vendor Dashboard
  static const vendorDashboardResourceListApi = apiMainPath + "API/ResourceList";
  static const vendorResourceScheduleApi = apiMainPath + "API/ResourceSchedule";
  static const bookingDetailsApi = apiMainPath + "API/BookingResource";

  /// Get Transaction
  static const getTransactionListApi = apiMainPath + "API/CustomerOrderListIndex";

  /// Privacy policy and Terms & Condition
  static const getPrivacyPolicyApi = apiMainPath + "API/CMS";

  static const logOutApi = apiMainPath + "API/Logout";


  /// Schedule management API
  static const getAutoScheduleApi = apiMainPath + "API/AutoSchedule";
  static const getAllResourceListApi = apiMainPath + "API/ResourceList";
  static const getAllSearchWithResourceListApi = apiMainPath + "API/ResourceSchedule";
}