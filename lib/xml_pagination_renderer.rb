class XmlPaginationRenderer < WillPaginate::LinkRenderer
  def initialize(collection, options, template)
    super(collection, options, template)
  end
  
  def to_html # misnomer
    buffer = ""
    xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2, :margin => 1)
    xml.link :rel => 'self', :href => url_for(@collection.current_page)
    xml.link :rel => 'next', :href => url_for(@collection.next_page) unless @collection.next_page.nil?
    xml.link :rel => 'prev', :href => url_for(@collection.previous_page) unless @collection.previous_page.nil?
    xml.target!
  end
end