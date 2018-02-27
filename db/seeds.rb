# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
genres = Genre.create([
  { name: 'Romance', description: "Two basic elements comprise every romance novel: a central love story and an emotionally-satisfying and optimistic ending."},
  { name: 'Mystery', description: "Any form of crime fiction in which a detective (either professional or amateur) solves a crime. " },
  { name: 'Fantasy', description: "A genre that uses magic and other supernatural forms as a primary element of plot, theme, and/or setting." }
  ])

authors = Author.create ([
  {name: "Agatha Christie" },
  {name: "John Green" },
  {name: "J.K. Rowling" },
  {name: "Jane Austen" },
  {name: "Gillian Flynn" },
  {name: "Penny Reid" },
  {name: "Stephen King" },
  {name: "J.R.R. Tolkien" }
  ])
  books = Book.create([
    { title: "And Then There Were None", author_id: 1, publication_year: 1939, genre_id: 2, blurb: "Ten strangers, apparently with little in common, are lured to an island mansion off the coast of Devon by the mysterious U.N.Owen. Over dinner, a record begins to play, and the voice of an unseen host accuses each person of hiding a guilty secret." },
    { title: "The Fault in Our Stars", author_id: 2, publication_year: 2012, genre_id: 1, blurb: "Hazel is a young teenage girl who has been diagnosed with lung cancer and attends a cancer support group where she meets a young boy named Augustus Waters."},
    { title: "Harry Potter and the Sorcerer's Stone", author_id: 3, publication_year: 2001, genre_id: 3, blurb: "Rescued from the outrageous neglect of his aunt and uncle, a young boy with a great destiny proves his worth while attending Hogwarts School of Witchcraft and Wizardry."},
    { title: "Pride and Prejudice", author_id: 4, publication_year: 1813, genre_id: 1, blurb: "A novel about the proud Mr. Darcy and the prejudiced Elizabeth Bennet as they play out their spirited courtship in a series of eighteenth-century drawing-room intrigues."},
    { title: "Gone Girl", author_id: 5, publication_year: 2012, genre_id: 2, blurb: "On a warm summer morning in North Carthage, Missouri, it is Nick and Amy Dunne’s fifth wedding anniversary. Presents are being wrapped and reservations are being made when Nick’s clever and beautiful wife disappears."},
    ])
