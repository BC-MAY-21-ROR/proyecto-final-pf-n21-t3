class DropSocialNetwork < ActiveRecord::Migration[6.1]
  def change
    drop_table :social_networks
  end
end
