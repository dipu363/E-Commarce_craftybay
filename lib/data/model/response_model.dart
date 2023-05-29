class ResponseModel{
  final bool isSuccess;
  final int statusCode ;
  final  dynamic returnData ;

  ResponseModel({required this.isSuccess, required this.statusCode, required this.returnData});
}