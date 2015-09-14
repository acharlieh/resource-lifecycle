default_action :foo

def initialize(new_resource, run_context)
  puts "**RESOURCE INITIALIZE"
  super
end

def after_created
  super
end

self.instance_methods.each do |method|
  alias_method "old_#{method}", method
  define_method(method) do |*args, &baz| 
    value = self.old___send__("old_#{method}", *args, &baz)
    puts "RESOURCE #{method} -> #{value.class}"
    return value
  end
end

puts "END RESOURCE"