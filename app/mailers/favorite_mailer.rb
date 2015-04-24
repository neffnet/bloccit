class FavoriteMailer < ApplicationMailer
  default from: "neff@neffnet.net"

  def new_comment(user,post,comment)
    # New headers
    headers["Message-ID"] = "<comments/#{comment.id}@neffnet-bloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@neffnet-bloccit.example>"
    headers["References"] = "<post/#{post.id}@neffnet-bloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
