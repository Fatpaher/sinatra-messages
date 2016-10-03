migration 'create the message table' do
  database.create_table? :messages do
    primary_key :id
    String      :text, null: false
    String      :option
    String      :link, null: false
    timestamp   :created_at

    index :link, unique: true
  end
end
