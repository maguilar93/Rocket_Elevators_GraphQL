class QuoteController < ApplicationController

    def index
        
    end
    def new_quote
        quote = Quote.new(params["quote"].permit!)
        quote.save
    end
end