class Patient < ActiveRecord::Base
  attr_accessible :accessovascolare, :cognome, :datanas, :diagnosi, :fattoreresiduo, :gruppo, :idpaz, :inibitore, :nome, :rh, :unitabetesda
end
