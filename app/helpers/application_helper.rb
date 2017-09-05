module ApplicationHelper
    def avatar(user)
        if user.fbprofile
        user.fbprofile+"?type=large"
    else
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&=150"
    end
        
    end
end
