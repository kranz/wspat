class Patient < ActiveRecord::Base
  attr_accessible :cognome, :nome, :idpaz, :gruppo, :rh, :diagnosi, 
                  :sesso, :datanascita, :livfattcar, :inibitore8, 
                  :unitab8, :preddavp1, :preddavp2, :preddavp3, :preddavp4, 
                  :preddavp5, :postddavp1, :postddavp2, :postddavp3, 
                  :postddavp4, :postddavp5, :accven, :accventipo, 
                  :rcof, :fibrinogeno, :concentrato, :fattII, :fattVII,
                  :fattVIII, :fattIX, :fattX, :fattXI, :fattXIII
end
