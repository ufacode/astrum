class AddDomainToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :domain, :string
    add_index :companies, :domain,  unique: true
  end
end
