///重写 [toString] 返回需要的网络错误格式
class NetException implements Exception {
  final String message;

  NetException(this.message);

  @override
  String toString() {
    return message;
  }
}
