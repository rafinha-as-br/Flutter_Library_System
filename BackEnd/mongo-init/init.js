db = db.getSiblingDB("biblioteca");

db.livro.insertMany([
    {
        "titulo": "MongoDB Essencial",
        "autor": "Carlos Silva",
        "ano": 2021,
        "genero": "Tecnologia",
        "exemplares": 5,
        "emprestimos": []
    },
    { "titulo": "Dom Casmurro", "autor": "Machado de Assis", "ano": 1899, "genero": "Literatura", "exemplares": 3, "emprestimos": ["joao123", "maria88"] },
    { "titulo": "Clean Code", "autor": "Robert C. Martin", "ano": 2008, "genero": "Tecnologia", "exemplares": 2, "emprestimos": ["ana_dev"] },
    { "titulo": "O Cortiço", "autor": "Aluísio Azevedo", "ano": 1890, "genero": "Literatura", "exemplares": 4, "emprestimos": [] },
    { "titulo": "Harry Potter e a Pedra Filosofal", "autor": "J.K. Rowling", "ano": 1997, "genero": "Fantasia", "exemplares": 6, "emprestimos": ["paulo21"] },
    { "titulo": "Senhor dos Anéis: A Sociedade do Anel", "autor": "J.R.R. Tolkien", "ano": 1954, "genero": "Fantasia", "exemplares": 5, "emprestimos": [] },
    { "titulo": "Introdução a Algoritmos", "autor": "Thomas H. Cormen", "ano": 2009, "genero": "Tecnologia", "exemplares": 3, "emprestimos": ["maria88"] },
    { "titulo": "Capitães da Areia", "autor": "Jorge Amado", "ano": 1937, "genero": "Literatura", "exemplares": 2, "emprestimos": [] },
    { "titulo": "1984", "autor": "George Orwell", "ano": 1949, "genero": "Ficção", "exemplares": 7, "emprestimos": ["joao123"] },
    { "titulo": "A Revolução dos Bichos", "autor": "George Orwell", "ano": 1945, "genero": "Ficção", "exemplares": 3, "emprestimos": [] },
    { "titulo": "Código Limpo em JavaScript", "autor": "Douglas Crockford", "ano": 2015, "genero": "Tecnologia", "exemplares": 4, "emprestimos": [] },
    { "titulo": "O Pequeno Príncipe", "autor": "Antoine de Saint-Exupéry", "ano": 1943, "genero": "Infantil", "exemplares": 10, "emprestimos": ["ana_dev"] },
    { "titulo": "It: A Coisa", "autor": "Stephen King", "ano": 1986, "genero": "Terror", "exemplares": 5, "emprestimos": [] },
    { "titulo": "O Hobbit", "autor": "J.R.R. Tolkien", "ano": 1937, "genero": "Fantasia", "exemplares": 6, "emprestimos": ["paulo21"] },
    { "titulo": "A Menina que Roubava Livros", "autor": "Markus Zusak", "ano": 2005, "genero": "Drama", "exemplares": 4, "emprestimos": [] }
]);