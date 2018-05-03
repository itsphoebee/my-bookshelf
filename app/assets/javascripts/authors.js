// $(function bindEventListeners() {
//   $(".js-next").on("click", function(e) {
//     e.preventDefault();
//     nextAuthor(this);
//   })
//
//   $(".js-previous").on("click", function(e) {
//     e.preventDefault();
//     previousAuthor(this);
//   })
// })
//
// function nextAuthor(author) {
//   var nextId = parseInt($(".js-next").attr("data-id")) + 1;
//   $.get("/authors/" + nextId + ".json", function(data) {
//   $(".authorName").text(data["name"]);
//
//   var books = data["books"]
//   var bookList = ""
//   books.forEach(function(book){
//     bookList += "<li>" + `<a href="/books/${book.id}">` + book.title+ `</a>` + " | " + book.publication_year + "</li>"
//   })
//   $(".books").html(bookList);
//
//   var genres = data["genres"]
//   // check for unique genres to list
//   var uniq = new Set(genres.map(e => JSON.stringify(e)));
//   var uniqGenres = Array.from(uniq).map(e => JSON.parse(e));
//   var genreList = ""
//   uniqGenres.forEach(function(genre){
//     genreList += `<a href="/genres/${genre.id}">` + genre.name+ `</a>` + " | "
//   })
//     genreList += "<br></br>"
//     $(".affiliatedGenres").html(genreList);
//
//     // reset the id to current on the link
//     $(".js-next").attr("data-id", data["id"]);
//     $(".js-previous").attr("data-id", data["id"]);
//   })
// }
//
// function previousAuthor () {
//   var lastId = parseInt($(".js-next").attr("data-id")) - 1;
//   $.get("/authors/" + lastId + ".json", function(data) {
//     $(".authorName").text(data["name"]);
//
//     var books = data["books"]
//     var bookList = ""
//     books.forEach(function(book){
//       var test = JSON.stringify(book)
//       bookList += "<li>" + `<a href="/books/${book.id}">` + book.title+ `</a>` + " | " + book.publication_year + "</li>"
//     })
//     $(".books").html(bookList);
//
//     var genres = data["genres"]
//     var uniq = new Set(genres.map(e => JSON.stringify(e)));
//     var uniqGenres = Array.from(uniq).map(e => JSON.parse(e));
//     var genreList = ""
//     uniqGenres.forEach(function(genre){
//       genreList += `<a href="/genres/${genre.id}">` + genre.name+ `</a>` + " | "
//     })
//     genreList += "<br></br>"
//     $(".affiliatedGenres").html(genreList);
//
//     // reset the id to current on the link
//     $(".js-next").attr("data-id", data["id"]);
//     $(".js-previous").attr("data-id", data["id"]);
//   });
// }
