class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
