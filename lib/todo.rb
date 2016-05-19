class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :type

  @@supported_priorities = ["high", "medium", "low"]

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    @type = "todo"
    if @priority and !(@@supported_priorities.include?(@priority))
      raise UdaciListErrors::InvalidPriorityValue, "invalid priority"
    end
  end

  def details
    format_description(@description) + "#{@type.ljust(10)}" "due: " +
      format_date(@due) +
      format_priority(@priority)
  end

  def change_priority(priority)
    @priority = priority
  end
end
