class Quote {
  String quote;
  String id;
  String dateOfCreation;
  String? category;

  Quote({required this.quote, required this.id, required this.dateOfCreation, this.category});

  @override
  String toString() {
    String data = "This is your quote: $quote, its id is: $id, its category is $category and it was created in: $dateOfCreation";
    return data;
  }
}