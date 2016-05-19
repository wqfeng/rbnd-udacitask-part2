class LinkItem
  include Listable
  attr_reader :description, :site_name, :type

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
    @type = "link"
  end
  
  def details
    format_description(@description) + "#{@type.ljust(10)}" + "site name: " + format_name(@site_name)
  end
end
