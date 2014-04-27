Sequel.migration do
  up do
    create_table(:colors) do
      primary_key :id
      String :name, :null=>false
      String :characteristic, :null=>false
      Integer :rating_1_to_5

    end
  end

  down do
    drop_table(:colors)
  end
end