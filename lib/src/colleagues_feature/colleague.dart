const colleagues = [
  Colleague(id: 'col-1', name: 'John Doe'),
  Colleague(id: 'col-2', name: 'Jane Smith'),
  Colleague(id: 'col-3', name: 'Mike Johnson'),
  Colleague(id: 'col-4', name: 'Emily Davis'),
  Colleague(id: 'col-5', name: 'Robert Brown'),
  Colleague(id: 'col-6', name: 'Sarah Wilson'),
  Colleague(id: 'col-7', name: 'David Lee'),
  Colleague(id: 'col-8', name: 'Olivia Taylor'),
  Colleague(id: 'col-9', name: 'James Anderson'),
  Colleague(id: 'col-10', name: 'Sophia Martinez'),
];

class Colleague {
  final String id, name;

  const Colleague({required this.id, required this.name});
}

extension ProfilePic on Colleague {
  String get profilePic {
    final index = int.tryParse(id.split('-').last) ?? 0;
    return 'https://picsum.photos/id/${index + 50}/200';
  }
}
