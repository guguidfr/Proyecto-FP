// use python;

db.createCollection("LIBROS");

db.createUser({
  user: "python",
  pwd: "prueba",
  roles: [
    { role: "readWrite", db: "python" }
  ]
});

db.LIBROS.insertMany([
  {
    isbn: "9788498389369",
    title: "Harry Potter y la piedra filosofal",
    author: "J.K. Rowling",
    genre: "Fantasia",
    release_date: "2001-01-01"
  },
  {
    isbn: "9788498389260",
    "title": "Harry Potter y la cámara secreta",
    author: "J.K. Rowling",
    genre: "Fantasia",
    release_date: "2002-01-01"
  },
  {
    isbn: "9788498389796",
    "title": "Harry Potter y la Orden del Fénix",
    author: "J.K. Rowling",
    genre: "Fantasia",
    release_date: "2003-01-01"
  },
  {
    isbn: "9788498387976",
    "title": "Juego de Tronos",
    author: "George R.R. Martin",
    genre: "Aventura",
    release_date: "2004-01-01"
  },
  {
    isbn: "9788498388973",
    "title": "Choque de Reyes",
    author: "George R.R. Martin",
    genre: "Aventura",
    release_date: "2005-01-01"
  },
  {
    isbn: "9788498389222",
    "title": "Canción de Hielo y Fuego",
    author: "George R.R. Martin",
    genre: "Aventura",
    release_date: "2006-01-01"
  },
  {
    isbn: "9788498389451",
    "title": "Ready Player One",
    author: "Ernest Cline",
    genre: "Ciencia-ficcion",
    release_date: "2007-01-01"
  },
  {
    isbn: "9788498389673",
    "title": "El marciano",
    author: "Andy Weir",
    genre: "Ciencia-ficcion",
    release_date: "2008-01-01"
  },
  {
    isbn: "9788498389543",
    "title": "La guerra de los mundos",
    author: "H.G. Wells",
    genre: "Ciencia-ficcion",
    release_date: "2009-01-01"
  },
  {
    isbn: "9788498389116",
    "title": "La vida de Pi",
    author: "Yann Martel",
    genre: "Aventura",
    release_date: "2010-01-01"
  },
  {
    isbn: "9788498389338",
    "title": "El hobbit",
    author: "J.R.R. Tolkien",
    genre: "Fantasia",
    release_date: "2011-01-01"
  },
  {
    isbn: "9788498389918",
    "title": "El Señor de los Anillos: La comunidad del anillo",
    author: "J.R.R. Tolkien",
    genre: "Fantasia",
    release_date: "2012-01-01"
  },
  {
    isbn: "9788498389758",
    "title": "El Señor de los Anillos: Las dos torres",
    author: "J.R.R. Tolkien",
    genre: "Fantasia",
    release_date: "2013-01-01"
  },
  {
    isbn: "9788498389031",
    "title": "El Señor de los Anillos: El retorno del Rey",
    author: "J.R.R. Tolkien",
    genre: "Fantasia",
    release_date: "2014-01-01"
  },
  {
    isbn: "9788498389642",
    "title": "1984",
    author: "George Orwell",
    genre: "Ciencia-ficcion",
    release_date: "2015-01-01"
  },
  {
    isbn: "9788498389161",
    "title": "Un mundo feliz",
    author: "Aldous Huxley",
    genre: "Ciencia-ficcion",
    release_date: "2016-01-01"
  },
  {
    isbn: "9788498389079",
    "title": "Crónica del pájaro que da cuerda al mundo",
    author: "Haruki Murakami",
    genre: "Biografia",
    release_date: "2017-01-01"
  },
  {
    isbn: "9788498389802",
    "title": "De ratones y hombres",
    author: "John Steinbeck",
    genre: "Biografia",
    release_date: "2018-01-01"
  },
  {
    isbn: "9788498389727",
    "title": "La naranja mecánica",
    author: "Anthony Burgess",
    genre: "Ciencia-ficcion",
    release_date: "2019-01-01"
  },
  {
    isbn: "9788498389680",
    "title": "El código Da Vinci",
    author: "Dan Brown",
    genre: "Aventura",
    release_date: "2020-01-01"
  },
  {
    isbn: "9788498389895",
    "title": "El niño con el pijama de rayas",
    author: "John Boyne",
    genre: "Biografia",
    release_date: "2021-01-01"
  },
  {
    isbn: "9788498389017",
    "title": "Los juegos del hambre",
    author: "Suzanne Collins",
    genre: "Aventura",
    release_date: "2022-01-01"
  },
  {
    isbn: "9788498389321",
    "title": "En llamas",
    author: "Suzanne Collins",
    genre: "Aventura",
    release_date: "2023-01-01"
  },
  {
    isbn: "9788498389130",
    "title": "Sinsajo",
    author: "Suzanne Collins",
    genre: "Aventura",
    release_date: "2024-01-01"
  },
  {
    isbn: "9788498389437",
    "title": "Los hombres que no amaban a las mujeres",
    author: "Stieg Larsson",
    genre: "Aventura",
    release_date: "2025-01-01"
  },
  {
    isbn: "9788498389092",
    "title": "El psicoanalista",
    author: "John Katzenbach",
    genre: "Aventura",
    release_date: "2026-01-01"
  },
  {
    isbn: "9788498389734",
    "title": "Cien años de soledad",
    author: "Gabriel García Márquez",
    genre: "Biografia",
    release_date: "2027-01-01"
  },
  {
    isbn: "9788498389864",
    "title": "El principito",
    author: "Antoine de Saint-Exupéry",
    genre: "Aventura",
    release_date: "2028-01-01"
  },
  {
    isbn: "9788498389833",
    "title": "El temor de un hombre sabio",
    author: "Patrick Rothfuss",
    genre: "Fantasia",
    release_date: "2030-01-01"
  },
  {
    isbn: "9788498389628",
    "title": "Canción de Hielo y Fuego: Tormenta de espadas",
    author: "George R.R. Martin",
    genre: "Aventura",
    release_date: "2031-01-01"
  },
  {
    isbn: "9788498389246",
    "title": "El hogar de Miss Peregrine para niños peculiares",
    author: "Ransom Riggs",
    genre: "Fantasia",
    release_date: "2032-01-01"
  }
]
);
