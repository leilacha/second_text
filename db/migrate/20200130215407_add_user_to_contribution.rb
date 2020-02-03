class AddUserToContribution < ActiveRecord::Migration[5.2]
  def change
    add_reference :contributions, :user, index: true, foreign_key: true
  end
end
