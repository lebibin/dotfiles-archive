require "awesome_print"
AwesomePrint.irb!
# credits to: http://www.justinweiss.com/blog/2014/06/17/fast-consistent-setup-for-your-ruby-and-rails-projects/
# returns the instance methods on klass
# that aren't already on Object
def m(klass)
  klass.public_instance_methods - Object.public_instance_methods
end
