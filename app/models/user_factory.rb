class UserFactory 
  class << self
    def create_normal(options = {})      
      default = {
        :email => "login@example.com",
        :login => "login",
        :password => "password"
      }.merge(options)
      
      user = User.find_by_login(default[:login])
      return user unless user.nil?
      
      default[:password_confirmation] = default[:password]      
      User.create default
    end
  end
end