class AdminConstraint
  def self.matches?(request)
    current_user = request.env['warden'].user
    current_user && current_user.instance_of?(AdminUser)
  end
end
