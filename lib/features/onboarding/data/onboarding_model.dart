class OnboardingModel {
  String image;
  String title;
  String desc;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.desc,
  });
  static List<OnboardingModel> onboardingView = [
    OnboardingModel(
      title: 'Book Your Appointment Easily',
      image: 'assets/images/onboarding1.png',
      desc:
          'Choose your preferred doctor, pick a \nsuitable time, and confirm your visit \nin just a few taps. No calls, no waiting\n—just simple and fast booking.',
    ),
    OnboardingModel(
      title: 'Find Doctors Around You',
      image: 'assets/images/onboarding2.png',
      desc:
          'Quickly discover trusted doctors near\n your area. Whether you need\n a general checkup or a specialist, we\n connect you with nearby clinics for\n fast and convenient care.',
    ),
  ];
}
