class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :idpaz
      t.string :cognome
      t.string :nome
      t.date :datanas
      t.string :gruppo
      t.string :rh
      t.string :diagnosi
      t.string :inibitore
      t.string :unitabetesda
      t.string :fattoreresiduo
      t.string :accessovascolare

      t.timestamps
    end
  end
end
