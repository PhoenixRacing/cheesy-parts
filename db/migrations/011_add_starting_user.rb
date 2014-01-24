require "pathological"

require "models/user"

Sequel.migration do
  up do
    user = User.new(:email => "deleteme@phoenix.com", :first_name => "Delete", :last_name => "Me",
                    :permission => "admin", :enabled => 1)
    user.set_password("baja")
    user.save
  end

  down do
    User[:email => "deleteme@phoenix.com"].delete rescue nil
  end
end