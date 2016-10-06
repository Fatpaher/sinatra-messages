Sequel.migration do
  change do
    add_column :messages, :password, :boolean, default: false, null: false
  end
end
