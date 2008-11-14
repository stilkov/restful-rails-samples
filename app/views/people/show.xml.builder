xml.instruct! :xml, :encoding => "UTF-8"
xml.person :xmlns => 'http://innoq.com/schemas/customers' do
  xml.last_name @person.last_name
  xml.given_name @person.given_name
  xml.link :rel => 'self', :href => customer_person_url(@customer, @person)
end