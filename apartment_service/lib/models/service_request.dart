class ServiceRequest {
  int status;
  DateTime logDate;
  DateTime endDate;
  String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";
  String title;
  int userId;

  ServiceRequest({this.status, this.title});

  static List<ServiceRequest> allData() {
    List<ServiceRequest> data = [
      ServiceRequest(status: 0, title: "Light not working"),
      ServiceRequest(status: 1, title: "AC not working"),
      ServiceRequest(status: 2, title: "Light replacement"),
      ServiceRequest(status: 3, title: "Light not working"),
    ];
    return data;
  }
}
