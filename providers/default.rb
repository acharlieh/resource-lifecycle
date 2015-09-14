
def initialize(new_resource, run_context)
  puts "**PROVIDER INITIALIZE"
  super
end

action :foo do

end

self.instance_methods.each do |method|
  alias_method "old_#{method}", method
  define_method(method) do |*args, &baz| 
    value = self.old___send__("old_#{method}", *args, &baz)
    puts "PROVIDER #{method} -> #{value.class}"
    return value
  end
end

puts "END PROVIDER"
