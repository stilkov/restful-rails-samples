class PeopleController < ApplicationController
  before_filter :set_customer
  
  def set_customer
    @customer = Customer.find(params[:customer_id], :include => :people)
  end
  
  def index
    @people = @customer.people
    respond_to do |format|
      format.xml # index.xml.builder
      format.json { render :json => @people }   
    end
  end

  def show
    begin
      @person = Person.find(params[:id])
      respond_to do |format|
        format.xml # show.xml.builder
        format.json { render :json => @person }   
      end
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.text { render :text => "No record with id #{params[:id]} found.\n", :status => 404 }
      end
    end
  end
  
  def create
    @person = Person.new_from_xml(params[:person])
    @customer.people << @person
    respond_to do |format|
      if @person.save
        format.xml  { render :action => 'show', :status => :created, :location => customer_person_url(@customer, @person) }
      else
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
        format.text  { render :text => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes_from_xml(params[:person])
        format.xml  { render :action => 'show' }
      else
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
        format.text  { render :text => @person.errors, :status => :unprocessable_entity }
      end
    end
    
  end
end
