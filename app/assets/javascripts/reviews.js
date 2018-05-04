class Review {
  constructor(review){
    this.id = review.id
    this.content = review.content
    this.user = review.user.email
  }
}
Review.prototype.renderReviewContent = function(){
  return `<strong> ${this.user} </strong> said ${this.content} <hr>`
}
