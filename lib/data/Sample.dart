import 'package:appucv2/models/Collocation.dart';
import 'package:appucv2/models/Post.dart';
import 'package:appucv2/models/User.dart';

class Sample {
  static User carolina = User(
      name: "Carolina",
      username: "@caro32",
      followers: 200,
      following: 10,
      profilePicture: "assets/users/carolina.jpg",
      collocation: [
        Collocation(
            name: "Artista",
            tags: ["Bordado", "Acuarelas", "Pintura"],
            thumbnail: "assets/photos/carolina/one.jpg",
            posts: [
              Post(
                location: "Piura, Perú",
                dateAgo: "hace una semana",
                photos: [
                  'assets/photos/carolina/one.jpg',
                  'assets/photos/carolina/two.jpg',
                ],
                relatedPhotos: [
                  // Añade aquí las fotos relacionadas
                  'assets/photos/carolina/one.jpg',
                  'assets/photos/carolina/two.jpg',
                ],
                user: User(
                  name: 'Nombre del usuario',
                  profilePicture: 'URL de la foto de perfil',
                  username: 'Nombre de usuario',
                  followers: 0, // Número de seguidores
                  following: 0, // Número de seguidos
                  collocation: [], // Añade aquí la collocation
                ),
              ),
              Post(
                location: "Piura, Perú",
                dateAgo: "hace una semana",
                photos: [
                  'assets/photos/carolina/one.jpg',
                  'assets/photos/carolina/two.jpg',
                ],
                relatedPhotos: [
                  // Añade aquí las fotos relacionadas
                  'assets/photos/carolina/one.jpg',
                  'assets/photos/carolina/two.jpg',
                ],
                user: User(
                  name: 'Nombre del usuario',
                  profilePicture: 'URL de la foto de perfil',
                  username: 'Nombre de usuario',
                  followers: 0, // Número de seguidores
                  following: 0, // Número de seguidos
                  collocation: [], // Añade aquí la collocation
                ),
              ),
            ]),
        Collocation(
            name: "Artista",
            tags: ["Bordado", "Acuarelas", "Pintura"],
            thumbnail: "assets/photos/carolina/two.jpg",
            posts: [
              Post(
                location: "Piura, Perú",
                dateAgo: "hace una semana",
                photos: [
                  'assets/photos/carolina/one.jpg',
                  'assets/photos/carolina/two.jpg',
                ],
                relatedPhotos: [
                  // Añade aquí las fotos relacionadas
                  'assets/photos/carolina/one.jpg',
                  'assets/photos/carolina/two.jpg',
                ],
                user: User(
                  name: 'Nombre del usuario',
                  profilePicture: 'URL de la foto de perfil',
                  username: 'Nombre de usuario',
                  followers: 0, // Número de seguidores
                  following: 0, // Número de seguidos
                  collocation: [], // Añade aquí la collocation
                ),
              ),
              Post(
                location: "Piura, Perú",
                dateAgo: "hace una semana",
                photos: [
                  'assets/photos/carolina/one.jpg',
                  'assets/photos/carolina/two.jpg',
                ],
                relatedPhotos: [
                  'assets/photos/carolina/one.jpg',
                  'assets/photos/carolina/two.jpg',
                ],
                user: User(
                  name: 'Nombre del usuario',
                  profilePicture: 'URL de la foto de perfil',
                  username: 'Nombre de usuario',
                  followers: 0, // Número de seguidores
                  following: 0, // Número de seguidos
                  collocation: [], // Añade aquí la collocation
                ),
              ),
            ]),
      ]);

  static User Samantha = User(
      name: "Samantha Carmona",
      username: "@sam92",
      followers: 300,
      following: 20,
      profilePicture: "assets/users/sam.jpg",
      collocation: [
        Collocation(
            name: "Artista",
            tags: ["Bordado"],
            thumbnail: "assets/photos/sam/one.jpg",
            posts: [
              Post(
                location: "Piura, Perú",
                dateAgo: "hace una semana",
                photos: [
                  'assets/photos/sam/one.jpg'
                      'assets/photos/sam/two.jpg',
                  'assets/photos/sam/three.jpg',
                ],
                relatedPhotos: [], // Añade aquí las fotos relacionadas
                user: User(
                  name: 'Nombre del usuario',
                  profilePicture: 'URL de la foto de perfil',
                  username: 'Nombre de usuario',
                  followers: 0, // Número de seguidores
                  following: 0, // Número de seguidos
                  collocation: [], // Añade aquí la collocation
                ),
              ),
              Post(
                location: "Piura, Perú",
                dateAgo: "hace dos semanas",
                photos: [
                  'assets/photos/sam/four.jpg'
                      'assets/photos/sam/five.jpg',
                  'assets/photos/sam/six.jpg',
                ],
                relatedPhotos: [], // Añade aquí las fotos relacionadas
                user: User(
                  name: 'Nombre del usuario',
                  profilePicture: 'URL de la foto de perfil',
                  username: 'Nombre de usuario',
                  followers: 0, // Número de seguidores
                  following: 0, // Número de seguidos
                  collocation: [], // Añade aquí la collocation
                ),
              ),
            ]),
        Collocation(
            name: "Artista",
            tags: ["Bordado"],
            thumbnail: "assets/photos/sam/one.jpg",
            posts: [
              Post(
                location: "Piura, Perú",
                dateAgo: "hace una semana",
                photos: [
                  'assets/photos/sam/one.jpg'
                      'assets/photos/sam/two.jpg',
                  'assets/photos/sam/three.jpg',
                ],
                relatedPhotos: [], // Añade aquí las fotos relacionadas
                user: User(
                  name: 'Nombre del usuario',
                  profilePicture: 'URL de la foto de perfil',
                  username: 'Nombre de usuario',
                  followers: 0, // Número de seguidores
                  following: 0, // Número de seguidos
                  collocation: [], // Añade aquí la collocation
                ),
              ),
              Post(
                location: "Piura, Perú",
                dateAgo: "hace dos semanas",
                photos: [
                  'assets/photos/sam/four.jpg'
                      'assets/photos/sam/five.jpg',
                  'assets/photos/sam/six.jpg',
                ],
                relatedPhotos: [], // Añade aquí las fotos relacionadas
                user: User(
                  name: 'Nombre del usuario',
                  profilePicture: 'URL de la foto de perfil',
                  username: 'Nombre de usuario',
                  followers: 0, // Número de seguidores
                  following: 0, // Número de seguidos
                  collocation: [], // Añade aquí la collocation
                ),
              ),
            ]),
      ]);

  static Post postOne = Post(
      user: Samantha,
      location: "Piura, Perú",
      dateAgo: "Hace dos semanas",
      photos: [
        'assets/photos/sam/one.jpg'
            'assets/photos/sam/two.jpg',
        'assets/photos/sam/three.jpg',
      ],
      relatedPhotos: [
        'assets/photos/sam/four.jpg'
            'assets/photos/sam/five.jpg',
        'assets/photos/sam/six.jpg',
      ]);

  static Post postTwo = Post(
      user: carolina,
      location: "Piura, Perú",
      dateAgo: "Hace dos semanas",
      photos: [
        'assets/photos/sam/one.jpg'
            'assets/photos/sam/two.jpg',
      ],
      relatedPhotos: [
        'assets/photos/sam/one.jpg'
            'assets/photos/sam/two.jpg'
      ]);
}
