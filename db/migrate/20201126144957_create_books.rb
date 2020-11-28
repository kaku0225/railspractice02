class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :bookname
      t.string :author
      t.text :comment

      t.timestamps
    end
  end
end
