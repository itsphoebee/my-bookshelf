$(document).on('turbolinks:load', () => {
  attachListeners()
})

function attachListeners() {
  $(".js-next").on("click", function(e) {
    e.preventDefault();
    nextAuthor();
  })

  $(".js-previous").on("click", function(e) {
    e.preventDefault();
    previousAuthor();
  })
}

function nextAuthor() {
  var id = parseInt($(".js-next").attr("data-id")) + 1;
  getInfo(id)
}

function previousAuthor () {
  var id = parseInt($(".js-previous").attr("data-id")) - 1;
  getInfo(id)
}

function getInfo(id){
  $.get("/authors/" + id + ".json", function(data) {
    $(".authorName").text(data["name"]);

    // find all books by specific author and add to view
    var books = data.books
    var bookList = ""
    books.forEach(function(book){
      bookList += `<li> <a href="/books/${book.id}"> ${book.title} </a> | ${book.publication_year} </li>`
    })
    $(".books").html(bookList);

    // find only unique genres then add to view
    var genres = data.genres
    var uniq = new Set(genres.map(e => JSON.stringify(e)));
    var uniqGenres = Array.from(uniq).map(e => JSON.parse(e));
    var genreList = ""
    uniqGenres.forEach(function(genre){
      genreList += `<a href="/genres/${genre.id}"> ${genre.name} </a> | <br></br>`
    })
    $(".affiliatedGenres").html(genreList);

    // reset the id to current id on the link
    $(".js-next").attr("data-id", data["id"]);
    $(".js-previous").attr("data-id", data["id"]);
  });
}
