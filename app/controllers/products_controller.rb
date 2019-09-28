# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all # this instance variable will be shared
  end
end
