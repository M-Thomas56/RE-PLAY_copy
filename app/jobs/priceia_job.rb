class PriceiaJob < ApplicationJob
  queue_as :default

  def perform(toy_id, clean:, complete:, playable:)
    toy = Toy.find(toy_id)
    toy.update(price: rand(5..15))
  end
end
