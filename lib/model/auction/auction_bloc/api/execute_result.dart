class ExecuteResult<T> {
  late T? data;
  late bool isOk;
  late String? stackTrace;
  late bool isError = false;
  ExecuteResult(this.data, this.isOk, this.isError, this.stackTrace);
  factory ExecuteResult.fromJson(Map<String, dynamic> map,T Function(Map<String, dynamic>)? dataConstructor) {
    return ExecuteResult(
      dataConstructor?.call(map['data']),
      map['isOk'],
      map['isError'],
      map['stackTrace']
    );
  }
}