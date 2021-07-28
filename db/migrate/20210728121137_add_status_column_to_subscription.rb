class AddStatusColumnToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :status, :binary
  end
end
