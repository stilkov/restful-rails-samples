class Person < ActiveRecord::Base
  belongs_to :customer

  def update_attributes_from_xml(xml)
    update_attributes(filter_xml(xml))
  end

  def self.new_from_xml(xml)
    Person.new(filter_xml(xml))
  end

  private
    def self.filter_xml(params)
      { :last_name => params[:last_name],
        :given_name => params[:given_name] }
    end

end
