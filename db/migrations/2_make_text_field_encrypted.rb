Sequel.migration do
  change do
    rename_column :messages, :text, :encrypted_text
    add_column    :messages, :encrypted_text_iv, String
  end
end
