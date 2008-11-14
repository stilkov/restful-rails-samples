# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def xml_pagination(collection)
    will_paginate(collection, :renderer => XmlPaginationRenderer)
  end
  
  def base_uri
    controller.request.protocol + controller.request.host_with_port
  end
end
