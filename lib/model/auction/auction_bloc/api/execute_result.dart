class ExecuteResult<T> {
  late T? data;
  late bool isOk;
  late String? message;
  late String? stackTrace;
  late bool isError = false;
  bool get isBad => !isOk;
  ExecuteResult(this.data, this.message, this.isOk, this.isError, this.stackTrace);
  factory ExecuteResult.fromJson(Map<String, dynamic> map,{T Function(Map<String, dynamic>)? dataConstructor, bool isList = false}) {
    return ExecuteResult(
      isList ? map['data'].map((x) => dataConstructor?.call(x)) : dataConstructor?.call(map['data']),
      map['message'],
      map['isOk'],
      map['isError'],
      map['stackTrace'],
    );
  }
}