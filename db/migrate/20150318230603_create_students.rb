class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :user, index: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone
      t.string :roll_no
      t.string :gender
      t.date :birthdate
      t.text :address
      t.text :mobile
      t.string :school
      t.string :email
      t.string :image
      t.references :institute, index: true

      t.timestamps
    end
  end
end
