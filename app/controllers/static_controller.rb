class StaticController < ApplicationController
    def home
        render json: "Welcome to the homepage. Navigate to /books, /members, /suggestions, or /book_groups."
    end
end