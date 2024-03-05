class Quote {
  String quote;
  String id;
  String dateOfCreation;

  Quote({required this.quote, required this.id, required this.dateOfCreation});

  @override
  String toString() {
    String data = "This is your quote: $quote, its id is: $id and it was created in: $dateOfCreation";
    return data;
  }
}