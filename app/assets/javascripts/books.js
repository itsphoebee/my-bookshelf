// $(function bindEventListeners() {
//   $(".js-more").on("click", function(e) {
//     e.preventDefault();
//     showFullReview(this);
//   })
//
//   $(".load-reviews").on("click", function(e) {
//     e.preventDefault();
//     loadAllReviews(this);
//   })
// })
//
// function showFullReview(review) {
//   var bookId = parseInt($(".bookTitle").attr("data-bookId"));
//   var reviewId = parseInt($(this).attr("data-id"))
//   $.get("/books/" + bookId + ".json", function(data) {
//     var reviews = data.reviews;
//     var reviewContent = ""
//     reviews.forEach(function(review){
//       if (review.id === reviewId){
//         reviewContent += review.content
//       }
//     })
//     $("#content-" + reviewId).html(reviewContent);
//   });
// }
//
// function loadAllReviews(review) {
//   var bookId = parseInt($(".bookTitle").attr("data-bookId"));
//   $.get("/books/" + bookId + "/reviews" + ".json", function(data) {
//     var reviews = data
//     var allReviews = ""
//     reviews.forEach(function(review){
//       allReviews += "<strong>" + review.user.email + "</strong>" + " said " + review.content + "<hr>"
//     })
//     $("#reviews").html(allReviews);
//   })
// }
