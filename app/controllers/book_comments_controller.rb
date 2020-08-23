class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		@book_comment = current_user.book_comments.build(book_comment_params)
		@book_comment.save
	end

	def destroy
	    @book_comment = BookComment.find(params[:id])
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment).merge(book_id: params[:book_id])
	end
end
