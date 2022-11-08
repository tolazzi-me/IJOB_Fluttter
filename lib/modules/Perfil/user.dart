class User {
  final String imagePath;
  final String nome;
  final String bio;

  const User({
    required this.imagePath,
    required this.nome,
    required this.bio,
  });
}

class UserDados {
  static const myUser = User(
    imagePath: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
    nome: 'Marcos Vieira',
    bio: 'Fotografia para mim é vida!',
  );
}
