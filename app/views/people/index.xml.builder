xml.instruct! :xml, :encoding => "UTF-8"
xml.people :xmlns => 'http://innoq.com/schemas/customers' do
  xml.link :rel => 'customer', :href => customer_url(@customer)
  @people.each do |person| 
    xml.person {
      xml.last_name person.last_name
      xml.given_name person.given_name
      xml.link :rel => 'self', :href => customer_person_url(@customer, person)
    }
  end
end