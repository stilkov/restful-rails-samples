class CustomersController < ApplicationController
  helper :people
  def index
    @customers = Customer.paginate :page => params[:page], :order => 'name ASC'
    respond_to do |format|
      format.xml  { response.content_type = 'application/vnd.innoq-customer+xml'} # index.xml.builder
      format.json { render :json => @customers }   
    end
  end
  
  def show
    begin
      @customer = Customer.find(params[:id], :include => :people)
      respond_to do |format|
        format.xml # show.xml.builder
        format.json { render :json => @customer }   
      end
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.text { render :text => "No record with id #{params[:id]} found.\n", :status => 404 }
      end
    end
  end
  
  def create
    @customer = Customer.new_from_xml(params[:customer])
      
    respond_to do |format|
      if @customer.save
        format.xml  { render :action => 'show', :status => :created, :location => @customer }
      else
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
        format.text  { render :text => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes_from_xml(params[:customer])
        format.xml  { render :action => 'show' }
      else
        format.xml  { render :xml => @customer.errors, :status => :unprocessable_entity }
        format.text  { render :text => @customer.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def destroy
    Customer.delete(params[:id])
    render :text => '', :status => 204
  end
end
