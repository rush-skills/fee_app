class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :user, index: true
      t.string :name
      t.integer :fee

      t.timestamps
    end
  end
end
