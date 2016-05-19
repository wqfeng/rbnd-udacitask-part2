class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  @@supported_priorities = ["high", "medium", "low"]

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    if @priority and !(@@supported_priorities.include?(@priority))
      raise UdaciListErrors::InvalidPriorityValue, "invalid priority"
    end
  end

  def details
    format_description(@description) + "due: " +
      format_date(@due) +
      format_priority(@priority)
  end
end
