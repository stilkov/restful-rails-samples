xml.instruct! :xml, :encoding => "UTF-8"
xml.customer :xmlns => 'http://innoq.com/schemas/customers' do
  xml.link :rel => 'self', :href => customer_url(@customer)
  xml.link :rel => 'people', :href => customer_people_url(@customer)
  xml.name @customer.name
  xml.city @customer.city
  xml.country @customer.country
  xml.people {
    @customer.people.each do |person| 
      xml.person {
        xml.last_name person.last_name
        xml.given_name person.given_name
        xml.link :rel => 'self', :href => customer_person_url(@customer, person)
      }
    end
  }
end