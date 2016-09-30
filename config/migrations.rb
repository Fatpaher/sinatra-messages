migration "create the people table" do
  database.create_table :messages do
    primary_key :id
    string      :text, null: false
    string      :option
    timestamp   :created_at
  end
end
