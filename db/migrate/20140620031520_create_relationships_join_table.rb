class CreateRelationshipsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :applicants, :people, { table_name: :relationships } do |t|
      # t.index [:applicant_id, :person_id]
      # t.index [:person_id, :applicant_id]
      t.column :kind, :string
    end
  end
end
