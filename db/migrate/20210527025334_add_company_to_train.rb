class AddCompanyToTrain < ActiveRecord::Migration[5.2]
  def change
    add_column :trains, :company, :integer, default: 0
  end
end
