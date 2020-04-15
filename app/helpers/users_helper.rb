module UsersHelper

  def user_image_tag(user,size)
    if user.avatar.attached?
      image_tag(user.avatar.variant(resize: "#{size}x#{size}!"))
    elsif user.image
      image_tag(user.image,size: "#{size}x#{size}")
    else
      image_tag(gravatar_url(user,size))
    end
  end

  def gravatar_url(user,size)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
  end
end