class WelcomeController < ApplicationController
  def index
    @subscription = Subscription.new
    @promo_swatches = Swatch.all.sample(3)
    @promo_fills = Fill.all.sample(12)
  end

  def about
  end
end
