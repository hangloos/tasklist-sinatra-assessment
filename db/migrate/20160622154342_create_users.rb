class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |x|
      x.string :username
      x.string :email
      x.string :password
      x.string :password_digest
    end
  end
end
