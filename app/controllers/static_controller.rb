class StaticController < ApplicationController
    def home
        render json: "This is the homepage. Navigate to books, members, or book_groups."
    end
end