



class Ticket {
  final String id;
  final String title;
  final String status;
  final String date;

  // Constructor: Untuk membuat objek tiket baru
  Ticket({
    required this.id, 
    required this.title, 
    required this.status, 
    required this.date,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      title: json['title'],
      status: json['status'],
      date: json['date'],
    );
  }
}
