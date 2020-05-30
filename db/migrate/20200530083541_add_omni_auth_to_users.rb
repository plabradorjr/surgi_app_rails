class AddOmniAuthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :sstring
    add_column :users, :uid, :string
  end
end
