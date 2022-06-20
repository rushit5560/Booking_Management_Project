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
   help,
   changePassword,
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
   availableTime,
   invoices,
   subscription,
   help,
   changePassword,
   logout,
   appointmentReport,
   invoiceReport,
   customerReport
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

enum SearchType {
   categoryWise,
   none
}

enum SearchType2 {
   none,
   dateTimeWise,
   anyTimeWise,
   additionalSlotWise,
   anyTimeWithAdditionalSlotWise
}