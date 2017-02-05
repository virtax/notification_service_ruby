class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text    :recipients
      t.string  :subject
      t.string  :body
      t.boolean :is_sent

      t.timestamps
    end
  end
end
