class CustomersController < ApplicationController
  require 'pry'
  def index
    # @customers = Customer.all.limit(10)

    # binding.pry
    if params[:keywords].present?
      @keywords = params[:keywords]
      customer_search_term = CustomerSearchTerm.new(@keywords)

      @customers = Customer.where(
        customer_search_term.where_clause,
        customer_search_term.where_args).
        order(customer_search_term.order)
    else
      @customers = []
    end
  end
end
