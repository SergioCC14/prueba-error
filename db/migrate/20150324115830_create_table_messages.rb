class CreateTableMessages < ActiveRecord::Migration
  def up

    drop_table :message

    create_table :messages do |t|
      t.string :author
      t.string :email
      t.text :content
      
      t.timestamps
    end
  end

  def down

    drop_table :messages

    create_table :message do |t|
      t.string :author
      t.string :email
      t.text :content
      
      t.timestamps
    end
  end

end
