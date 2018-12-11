class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :token_reset
      t.boolean :status
      t.boolean :deleted

      t.timestamps
    end
  end
end