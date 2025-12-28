abstract class CreateBookRemoteDataSource {
  Future<int> createBook(
      {required int doctorId,
      required String appointmentDate,
      required String appointmentTime});
}
