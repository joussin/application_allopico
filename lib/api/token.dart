

class Token {
  

    bool status;

    String message;

    String token;

    
  

   Token({
      required this.status,
      required this.message,
      required this.token,
  });


  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      status: json['status'],
      message: json['message'],
      token: json['token'],
    );
  }
}

