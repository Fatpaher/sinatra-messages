Sequel.migration do
  change do
    add_column :messages, :option_value, Integer
  end
end
