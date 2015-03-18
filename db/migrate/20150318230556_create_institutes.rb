class CreateInstitutes < ActiveRecord::Migration
  def change
    create_table :institutes do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
