class CreateFeePayments < ActiveRecord::Migration
  def change
    create_table :fee_payments do |t|
      t.references :course, index: true
      t.references :student, index: true
      t.references :institute, index: true
      t.integer :paid

      t.timestamps
    end
  end
end
