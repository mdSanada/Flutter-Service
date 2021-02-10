class ApiResponse<T> {
  Status status;
  T data;
  T error;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.error) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Error : $error \n Data : $data";
  }
}

enum Status { COMPLETED, ERROR }
