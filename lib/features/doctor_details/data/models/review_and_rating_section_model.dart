class ReviewAndRatingSectionModel {
  final String image;
  final double data;
  final String title;
  final String? displayValue;

  ReviewAndRatingSectionModel(
      {required this.image,
      required this.data,
      required this.title,
      this.displayValue});
}
