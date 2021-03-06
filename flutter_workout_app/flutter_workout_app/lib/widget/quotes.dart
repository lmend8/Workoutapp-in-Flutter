// quotes API that is generating a new quote on the user profle page.

class Quote {
  int quoteId;
  String quoteText;
  String quoteDate;
  String quoteAuthor;
  Quote({this.quoteId, this.quoteText, this.quoteDate, this.quoteAuthor});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quoteText: json['quote']['body'],
      quoteAuthor: json['quote']['author'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': quoteId,
      'quote_text': quoteText,
      'quote_author': quoteAuthor,
    };
  }

  Quote.fromMap(Map<String, dynamic> map) {
    quoteId = map['id'];
    quoteText = map['quote_text'];
    quoteAuthor = map['quote_author'];
  }
}
