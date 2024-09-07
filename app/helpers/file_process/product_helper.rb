# frozen_string_literal: true

module FileProcess
  module ProductHelper
    def total_items(products, product_item)
      products.sum { |product| product.public_send(product_item) }
    end
  end
end
