module CommentsHelper
  def display_comment(comment)
    comment.empty? ? 'none' : comment
  end
end