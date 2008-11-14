class Customer < ActiveRecord::Base
  has_many :people
  def update_attributes_from_xml(xml)
    update_attributes(filter_xml(xml))
  end
  
  def self.new_from_xml(xml)
    Customer.new(filter_xml(xml))
  end
  
private
  def filter_xml(params)
    { :name => params[:name],
      :city => params[:city],
      :country => params[:country] }
  end
end
