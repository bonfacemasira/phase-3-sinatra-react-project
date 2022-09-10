class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.datetime :publishedDate
      t.string :description
      t.integer :pageCount
      t.integer :averageRating
      t.integer :ratingsCount
      t.string :imageLinks #medium
      t.string :language
    end
  end
end
