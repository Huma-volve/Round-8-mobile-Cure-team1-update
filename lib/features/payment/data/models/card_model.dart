class CardModel {
  final String holderName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String type; // e.g., 'Visa', 'MasterCard'

  CardModel({
    required this.holderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.type,
  });
}
