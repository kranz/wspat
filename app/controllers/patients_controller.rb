class PatientsController < ApplicationController
  include WashOut::SOAP
  # GET /patients
  # GET /patients.json

  soap_action "get_elenco_pazienti",
             :return => [ {:cognome => :string, 
                           :nome => :string, 
                           :idpaz => :string}]  
  def get_elenco_pazienti
    @pazienti = Patient.all
    if @pazienti then
      @arr = []
      @pazienti.each do |paziente|
          pat_data = {:cognome => paziente.cognome,
                      :nome => paziente.nome,
                      :idpaz => paziente.idpaz}
          @arr.push(pat_data)
      end
      render :soap => @arr
    else
      raise SOAPError, "Elenco Pazienti vuoto"
    end
  end

  soap_action "get_paziente",
             :args   => { :cognome => :string, :nome => :string },
             :return => { :paziente => {
                            :cognome => :string, 
                            :nome => :string,
                            :idpaz => :string,
                            :datanas => :date,
                            :gruppo => :string,
                            :rh => :string,
                            :diagnosi => :string, 
                            :inibitore => :string,
                            :unitabetesda => :string,
                            :fattoreresiduo => :string,
                            :accessovascolare => :string
                          }
                        }  

  def get_paziente
    @p = Patient.find_by_cognome_and_nome(params[:cognome], params[:nome])
    if @p then
       render :soap => {
                  :paziente => {
                  :cognome => @p.cognome,
                  :nome => @p.nome,
                  :idpaz => @p.idpaz.to_s,
                  :datanas => @p.datanas,
                  :gruppo => @p.gruppo,
                  :rh => @p.rh,
                  :diagnosi => @p.diagnosi, 
                  :inibitore => @p.inibitore,
                  :unitabetesda => @p.unitabetesda.to_s,
                  :fattoreresiduo => @p.fattoreresiduo.to_s,
                  :accessovascolare => @p.accessovascolare
              }
           }
    else
      raise SOAPError, "Paziente non trovato"
    end
  end

  def index
    @patients = Patient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, :notice => 'Patient was successfully created.' }
        format.json { render :json => @patient, :status => :created, :location => @patient }
      else
        format.html { render :action => "new" }
        format.json { render :json => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, :notice => 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end
end
