class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column :product_id, :integer
      t.column :user_title, :string
      t.column :rating, :integer
      t.column :content_body, :text

    end
  end
end
