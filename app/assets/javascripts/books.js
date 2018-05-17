$(document).on('turbolinks:load', () => {
  attachEventListeners()
})

function attachEventListeners() {
  $(".add-review").on("click", function(e) {
    e.preventDefault();
    getForm();
  });

  $(".load-reviews").on("click", function(e) {
    e.preventDefault();
    loadAllReviews()
  });

  $('#review_form').on("submit", function(e){
    e.preventDefault();
    submitReview(this)
  });

  $(".js-more").on("click", function(e) {
    e.preventDefault();
    showReview(this);
  });
}

function getForm() {
  var x = document.getElementById("newreview")
  x.style.display = "block"
}

function loadAllReviews() {
  const bookId = parseInt($(".bookTitle").attr("data-bookId"));
  $.get("/books/" + bookId + "/reviews" + ".json", function(data) {
    var allReviews = ""
    data.forEach(function(review){
      var currentReview = new Review(review)
      allReviews += currentReview.renderReviewContent()
    })
    $("#reviews").html(allReviews);
  })
};

function showReview(review) {
  var bookId = parseInt($(".bookTitle").attr("data-bookId"));
  var reviewId = parseInt($(review).attr("data-id"))
  $.get("/books/" + bookId + ".json", function(data) {
    var reviews = data.reviews;
    reviews.forEach(function(review){
      if (review.id === reviewId){
        currentReview = new Review(review)
      }
    })
    $("#content-" + reviewId).html(currentReview.renderReviewContent());
  });
}

function submitReview(review){
  var url = review.action
  $.post(url,$(review).serialize())
  .done(function(response){
    var newReview = new Review(response)
    var content = newReview.renderReviewContent()
    $("#reviews").append(content)
    clearForm();
  })
}

function clearForm(){
  var x = document.getElementById("newreview")
  $("#review_content").val("")
  x.style.display = "none"
  $('input[type="submit"]').prop('disabled', false);
}
