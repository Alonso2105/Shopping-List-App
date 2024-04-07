# frozen_string_literal: true

class ProductGroupComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(date:, products:)
    @date = date
    @products = products
  end

  def formatted_date
    I18n.l(@date, format: :default)
  end
end
