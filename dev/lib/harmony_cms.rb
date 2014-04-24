require 'harmony_cms/engine'
require 'harmony_cms/processors'
require 'harmony_cms/components'

module HarmonyCms
  extend Config
end

#a place holder to ignore the cq specific functionality.
#TODO: figure out a better way.
def cq_load_resource(file_name)
end
