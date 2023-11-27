class ExecuteResult<T> {
  late List<T?>? data;
  late bool isOk;
  late String? message;
  late String? stackTrace;
  late bool isError = false;
  bool get isBad => !isOk;
  T? get single => data?.first;
  ExecuteResult(this.data, this.message, this.isOk, this.isError, this.stackTrace);
  factory ExecuteResult.fromJson(Map<String, dynamic> map, {bool isList = false, T Function(Map<String, dynamic>)? dataConstructor}) {
    return ExecuteResult(
      map['data'] == null ? null : dataConstructor == null ? null : isList ? map['data']?.map<T>((x) => dataConstructor.call(x))?.toList() : [dataConstructor.call(map['data'])],
      map['message'],
      map['isOk'],
      map['isError'],
      map['stackTrace'],
    );
  }
}

class BaseExecuteResult {
  late bool isOk;
  late String? message;
  late String? stackTrace;
  late bool isError = false;
  bool get isBad => !isOk;
  BaseExecuteResult(this.message, this.isOk, this.isError, this.stackTrace);
}

class ListExecuteResult<T> extends BaseExecuteResult {
  final List<T>? data;
  ListExecuteResult(this.data, String? message, bool isOk, bool isError, String? stackTrace) : super(message, isOk, isError, stackTrace);
  factory ListExecuteResult.fromJson(Map<String, dynamic> map,{T Function(Map<String, dynamic>)? dataConstructor}) {
    return ListExecuteResult(
      map['data']?.map<T>((x) => dataConstructor?.call(x))?.toList(),
      map['message'],
      map['isOk'],
      map['isError'],
      map['stackTrace'],
    );
  }
}