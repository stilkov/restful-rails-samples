xml.instruct! :xml, :encoding => "UTF-8"
xml.customers :xmlns => 'http://innoq.com/schemas/customers', 'xml:base' => base_uri do
  xml.target! << xml_pagination(@customers)
  @customers.each { |c|
    xml.customer {
      xml.name c.name
      xml.link :rel => 'detail', :href => customer_path(c)
    }
  }
end