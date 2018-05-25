# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

config.gem "mislav-will_paginate", :lib => "will_paginate", :source => "http://gems.github.com"
