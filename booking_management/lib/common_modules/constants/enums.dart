enum AppBarOption {
  none,
  singleBackButtonOption,
  userConversationScreen,
}

enum CustomerDrawerOption {
  profile,
  chat,
  orderList,
  bookingHistory,
  payment,
  transaction,
  help,
  changePassword,
  termsAndCondition,
  privacyPolicy,
  logOut,
  favourites,
  login
}

enum VendorDrawerOption {
  profile,
  myCustomer,
  chat,
  bookingHistory,
  wallet,
  resources,
  services,
  additionalSlot,
  businessDocument,
  review,
  scheduleTime,
  scheduleManagement,
  availableTime,
  invoices,
  subscription,
  help,
  changePassword,
  logout,
  appointmentReport,
  invoiceReport,
  customerReport,
  termsAndCondition,
  privacyPolicy,
  subscriptionReport,
  appointmentList,
  bankAccountInfo
}

enum AvailableTimeDay {
  sundayStartTime,
  sundayEndTime,
  mondayStartTime,
  mondayEndTime,
  tuesdayStartTime,
  tuesdayEndTime,
  wednesdayStartTime,
  wednesdayEndTime,
  thursdayStartTime,
  thursdayEndTime,
  fridayStartTime,
  fridayEndTime,
  saturdayStartTime,
  saturdayEndTime
}

enum SearchType { categoryWise, none }

enum SearchType2 {
  none,
  dateTimeWise,
  anyTimeWise,
  additionalSlotWise,
  anyTimeWithAdditionalSlotWise
}

enum SignInRoute { none, fromBookScreen }

enum SubscriptionOption {
  none,
  drawer,
  direct,
}

enum SearchWise {
  none, dateWise
}