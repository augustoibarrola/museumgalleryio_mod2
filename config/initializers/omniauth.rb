Rails.application.config.middleware.use OmniAuth::Builder do 
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end

#tells Rails app to use a middleware created by OmniAuth gem for the Facebook authentication strategy

#key&secret are in .env; .env has been added to .gitignore

#<%= link_to('Log in with Facebook!', 'auth/facebook') %> link in views/layouts/application.html.erb initiates fb oauth process

#@user model + sessionscontroller is needed to track users who log in via facebook
    #@user model needs name, email, image, uid (all strings)(uid=user's ID on Facebook)

#fb will redirect users in the callback phase of the login to sessions#create

# <img src="<%= @user.profile_picture %>" alt="<%= @user.name %> Profile Pic" class="profile-picture" width="700" height="600">
# <h2><%= @user.name  %></h2>
# <p class="user-bio"> <%= @user.bio %> </p>