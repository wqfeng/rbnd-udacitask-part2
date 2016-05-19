class UdaciList
  attr_reader :title, :items

  @@artii = Artii::Base.new :font => 'slant'
  @@supported_types = ["todo", "event", "link"]

  def initialize(options={})
    @title = options[:title]? options[:title]: "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    raise UdaciListErrors::InvalidItemType, "invalid item type" if not @@supported_types.include?(type)

    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end
  def delete(index)
    raise UdaciListErrors::IndexExceedsListSize, "no such item" if index >= @items.length
    @items.delete_at(index - 1)
  end
  def all
    # puts "-" * @title.length * 5
    puts @@artii.asciify @title
    puts "-" * @title.length * 5
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
  def filter(type)
    @items.select { |e| e.type == type  }
  end
end
