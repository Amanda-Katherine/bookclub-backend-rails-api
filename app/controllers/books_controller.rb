class BooksController < ApplicationController
    def index
        books = Book.all
        render json: books
    end

    def create 
        book = Book.find_by(title: params["book"]["title"], author: params["book"]["author"])

        if book
            render json: book
        else 
            book = Book.new(book_params)

            if book.save
                render json: book
            else
                render json: {message:comment.errors.full_messages}
            end
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :image, :description)
    end
end
