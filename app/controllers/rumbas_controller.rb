# app/controllers/rumbas_controller.rb
class RumbasController < ApplicationController
  include WashOut::SOAP

  soap_action "get_elenco_pazienti",
             :return =>  { :riga_elenco => [{:cognome => :string, 
                           :nome => :string, 
                           :id_paz => :string}] }
  def get_elenco_pazienti
    elenco = {}
    @pazienti = Patient.all
    if @pazienti then
      @arr = []
      @pazienti.each do |paziente|
          pat_data = {:cognome => paziente.cognome,
                      :nome => paziente.nome,
                      :id_paz => paziente.idpaz }
          @arr.push(pat_data)
      end
      elenco[:riga_elenco] = @arr
      render :soap => elenco
#     render :soap => @arr
    else
      raise SOAPError, "Elenco Pazienti vuoto"
    end
  end

  soap_action "get_paziente",
             :args   => { :cognome => :string, :nome => :string },
             :return => { :paziente => {
                            :cognome => :string, 
                            :nome => :string,
                            :id_paz => :string,
                            :datanascita => :date,
                            :gruppo => :string,
                            :rh => :string,
                            :diagnosi => :string, 
                            :sesso => :string,
                            :livfattcar => :string,
                            :inibitore8 => :string,
                            :unitab8 => :string,
                            :preddavp1 => :string,
                            :preddavp2 => :string,
                            :preddavp3 => :string,
                            :preddavp4 => :string,
                            :preddavp5 => :string,
                            :postddavp1 => :string,
                            :postddavp2 => :string,
                            :postddavp3 => :string,
                            :postddavp4 => :string,
                            :postddavp5 => :string,
                            :accven => :string,
                            :accventipo => :string,
                            :rcof => :string,
                            :fibrinogeno => :string,
                            :concentrato => :string,    
                            :fatt_ii => :string,
                            :fatt_vii => :string,    
                            :fatt_viii => :string,    
                            :fatt_ix => :string,    
                            :fatt_x => :string,    
                            :fatt_xi => :string,    
                            :fatt_xiii => :string
                          }
                        }  
  def get_paziente
    @co = params[:cognome]
    @no = params[:nome]
    @p = Patient.find_by_cognome_and_nome(params[:cognome], params[:nome])

    if @p then
       render :soap => {
                  :paziente => {
                  :cognome => @p.cognome,
                  :nome => @p.nome,
                  :id_paz => @p.idpaz.to_s,
                  :gruppo => @p.gruppo,
                  :rh => @p.rh,
                  :diagnosi => @p.diagnosi, 
                  :sesso => @p.sesso,
                  :datanascita => @p.datanascita,
                  :livfattcar => @p.livfattcar,
                  :inibitore8 => @p.inibitore8,
                  :unitab8 => @p.unitab8,
                  :preddavp1 => @p.preddavp1,
                  :preddavp2 => @p.preddavp2,
                  :preddavp3 => @p.preddavp3,
                  :preddavp4 => @p.preddavp4,
                  :preddavp5 => @p.preddavp5,
                  :postddavp1 => @p.postddavp1,
                  :postddavp2 => @p.postddavp2,
                  :postddavp3 => @p.postddavp3,
                  :postddavp4 => @p.postddavp4,
                  :postddavp5 => @p.postddavp5,
                  :accven => @p.accven,
                  :accventipo => @p.accventipo,
                  :rcof => @p.rcof,
                  :fibrinogeno => @p.fibrinogeno,
                  :concentrato => @p.concentrato,    
                  :fatt_ii => @p.fattII,
                  :fatt_vii => @p.fattVII,    
                  :fatt_viii => @p.fattVIII,    
                  :fatt_ix => @p.fattIX,    
                  :fatt_x => @p.fattX,    
                  :fatt_xi => @p.fattXI,    
                  :fatt_xiii => @p.fattXIII
              }
           }
    else
      raise SOAPError, "Paziente non trovato"
    end
  end


  # Simple case
  soap_action "integer_to_string",
              :args   => :integer,
              :return => :string
  def integer_to_string
    render :soap => params[:value].to_s
  end

  soap_action "se_ti_dico",
              :args   => :string,
              :return => :string
  def se_ti_dico
    case params[:value]
    when "governo ladro"  
      tirispondo = "poffarbacco, non lo sapevo!"
    when "arotestabanse"
      tirispondo = "eh?"
    when "puppa"
      tirispondo = "uno a zero"
    else
      tirispondo = "ma va a giocare con i puffi..."
    end
    render :soap => tirispondo
  end

  soap_action "concat",
              :args   => { :a => :string, :b => :string },
              :return => :string
  def concat
    render :soap => (params[:a] + params[:b])
  end

  # Complex structures
  soap_action "AddCircle",
              :args   => { :circle => { :center => { :x => :integer,
                                                     :y => :integer },
                                        :radius => :double } },
              :return => nil, # [] for wash_out below 0.3.0
              :to     => :add_circle
  def add_circle
    circle = params[:circle]

    raise SOAPError, "radius is too small" if circle[:radius] < 3.0

    Circle.new(circle[:center][:x], circle[:center][:y], circle[:radius])

    render :soap => nil
  end

  # Arrays
  soap_action "integers_to_boolean",
              :args => { :data => [:integer] },
              :return => [:boolean]
  def integers_to_boolean
    render :soap => params[:data].map{|x| x ? 1 : 0}
  end

  # You can use all Rails features like filtering, too. A SOAP controller
  # is just like a normal controller with a special routing.
  before_filter :dump_parameters
  def dump_parameters
    Rails.logger.debug params.inspect
  end
end

