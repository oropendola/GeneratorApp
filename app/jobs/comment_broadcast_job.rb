class CommentBroadcastJob < ActiveJob

  queue_as :default

  def perform(comment)

     ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)

  end

  def render_comment(comment)

     CommentsController.render partial: 'comments/comments', locals: {comment: comment}

  end

end