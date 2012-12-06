class AddFieldsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :sesso, :string
    add_column :patients, :datanascita, :date
    add_column :patients, :livfattcar, :string
    add_column :patients, :inibitore8, :string
    add_column :patients, :unitab8, :string
    add_column :patients, :preddavp1, :string
    add_column :patients, :preddavp2, :string
    add_column :patients, :preddavp3, :string
    add_column :patients, :preddavp4, :string
    add_column :patients, :preddavp5, :string
    add_column :patients, :postddavp1, :string
    add_column :patients, :postddavp2, :string
    add_column :patients, :postddavp3, :string
    add_column :patients, :postddavp4, :string
    add_column :patients, :postddavp5, :string
    add_column :patients, :accven, :string
    add_column :patients, :accventipo, :string
    add_column :patients, :rcof, :string
    add_column :patients, :fibrinogeno, :string
    add_column :patients, :concentrato, :string
    add_column :patients, :fattII, :string
    add_column :patients, :fattVII, :string
    add_column :patients, :fattVIII, :string
    add_column :patients, :fattIX, :string
    add_column :patients, :fattX, :string
    add_column :patients, :fattXI, :string
    add_column :patients, :fattXIII, :string
    remove_column :patients, :datanas
    remove_column :patients, :inibitore
    remove_column :patients, :unitabetesda
    remove_column :patients, :fattoreresiduo
    remove_column :patients, :accessovascolare
  end
end
