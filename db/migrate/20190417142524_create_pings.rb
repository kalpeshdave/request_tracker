class CreatePings < ActiveRecord::Migration[5.2]
  def change
    create_table :pings do |t|
      t.string :original_url
      t.text :query_params
      t.text :errors

      t.timestamps
    end
  end
end
