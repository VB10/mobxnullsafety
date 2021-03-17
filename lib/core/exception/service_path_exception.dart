class ServicePathException<T> implements Exception {
  final T data;

  ServicePathException(this.data);
  @override
  String toString() {
    return 'Doesnt found this enum: ';
  }
}
