class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick
      t.string :remember_token
      t.string :rank
      t.string :password
      t.string :password_salt

      t.timestamps
    end

    create_table :posts do |t|
      t.string :title
      t.string :permalink
      t.text :content
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end

    create_table :category do |t|
      t.string :name
      t.string :slug_es
      t.string :description
      
      t.timestamps
    end

    create_table :message do |t|
      t.string :author
      t.string :email
      t.text :content
      
      t.timestamps
    end

  end
end
