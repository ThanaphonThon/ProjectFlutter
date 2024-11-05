// request_item.dart
class RequestItem {
  final String code;
  final String date;
  final String time;
  final RequestStatus status;

  RequestItem({
    required this.code,
    required this.date,
    required this.time,
    required this.status,
  });
}

enum RequestStatus {
  waiting,
  approved,
  notApproved,
  saveDraft,
}
