class ApiRequestFailure {
  final dynamic error;

  ApiRequestFailure(this.error);

  String get message {
    try{
      return error.message;
    }catch (e){
      return "$e";
    }
  }
}

