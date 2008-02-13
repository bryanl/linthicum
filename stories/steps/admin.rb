steps_for :admin do

  Given "a user with login '$login' and password '$pass'" do |login, pass|    
    create_user(login, pass)
  end
    
  Given "no users" do 
    User.destroy_all
  end
  
  Given "a valid user" do
    admin = %w[admin admin]
    @user = create_user(*admin)
    login(*admin)    
  end
  
  Given "user '$user' creates $count random articles" do |user, count|
    ArticleFactory.create_multiple count.to_i, :user => User.find_by_login(user)
  end
  
  When "I visit $path" do |path|
    get path
    response.should_not be_error
  end
  
  When "I log in with login '$login' and password '$pass'" do |login, pass|
    login(login, pass)
  end
  
  When "I click the '$text' link" do |text|
    clicks_link text
  end
    
  Then "I should be redirected to $path" do |path|
    response.should redirect_to(path)
  end
    
  Then "the page should have text \"$text\"" do |text|
    response.should be_success
    response.should have_text(/#{text}/)
  end
  
  Then "I should not be redirected" do
    response.should_not be_redirect
  end
  
  Then "there should be a list of posts" do 
    pending "should create sone posts"
  end
  
  Then "there should be a list with $count articles" do |count|
    response.should have_tag("div#articles") do
      count.to_i.times do |x|
        with_tag("li")
      end
    end
  end
  
  Then "there should not be a list with articles" do
    response.should_not have_tag("div#articles")
  end
  
end

def create_user(login, password)
  lambda { 
    user = UserFactory.create_normal(:login => login, :password => password)
  }.should change(User, :count).by(1)
end

def login(login, password)
  post_via_redirect "/admin/session", {:login => login, :password => password}
  response.should be_success
end


