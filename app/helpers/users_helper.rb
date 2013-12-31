module UsersHelper
    def gravatar_for(user, options = { size: 50})
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
    
    def team_relationship_for(user, team)
      @team_user = Teams_User.where(user_id: user.id, team_id: team.id)
    end
    
    def join_team_time_for(user, team)
      @team_user = Teams_User.where(user_id: user.id, team_id: team.id).first
      @team_user.created_at
    end
end
