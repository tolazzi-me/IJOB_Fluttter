class User {
  final int id;
  final String name;
  final String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

// Seu usuario
final User currentUser = User(
  id: 0,
  name: 'Usuario',
  imageUrl: 'assets/Chat1.jpg',
);

// Usuarios
final User user1 = User(
  id: 1,
  name: 'Ricardo Aloz',
  imageUrl: 'assets/Pessoa1.jpg',
);
final User user2 = User(
  id: 2,
  name: 'Ana Febaz',
  imageUrl: 'assets/Pessoa2.jpg',
);
final User user3 = User(
  id: 3,
  name: 'Royal Quartz',
  imageUrl: 'assets/Pessoa3.jpg',
);
