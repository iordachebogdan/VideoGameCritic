class AddPlatformIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :platform_id, :int
  end
end
