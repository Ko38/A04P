class ChangeSessionTokenToNull < ActiveRecord::Migration[5.1]
  def change
    change_column(:users, :session_token, :string, null: true)
  end
end
