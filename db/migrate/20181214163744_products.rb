class Products < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :description, :text

      t.timestamps
    end

    create_table :reviews do |t|
      t.column :username, :string
      t.column :rating, :integer
      t.column :content_body, :text

    end
  end
end
