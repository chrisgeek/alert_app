class CreateAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :alerts do |t|
      t.string :type
      t.string :description
      t.string :origin
      t.string :tag, array: true, default: [], using: "(string_to_array(tag, ','))"

      t.timestamps
    end
  end
end
