class MybookingModel {
  final String bookingStatus;
  final String buttonActionName;
  final String buttonOptionName;
  final bool isUpcomingStatus;
  final bool isCnaceledButton;
  MybookingModel(
      {required this.bookingStatus,
      required this.buttonActionName,
      required this.buttonOptionName,
      this.isCnaceledButton = false,
      this.isUpcomingStatus = false});
}
