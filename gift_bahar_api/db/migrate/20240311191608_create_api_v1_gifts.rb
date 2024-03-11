class CreateApiV1Gifts < ActiveRecord::Migration[7.1]
  def change
    create_table :api_v1_gifts do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
