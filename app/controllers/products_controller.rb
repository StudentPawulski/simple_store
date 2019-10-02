# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all # this instance variable will be shared
    @count = Product.count
    @average = Product.average(:price)
    @sum = Product.sum(:stock_quantity)
    @category = Category.all
  end
end
