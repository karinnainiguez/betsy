module ApplicationHelper
  def average_rating
    reviews = self.reviews

    return 0 if reviews.count == 0

    total = reviews.map do |rating|
      rating.rating
    end.sum.to_f

    return total / reviews.count

  end
