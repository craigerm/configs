RSpec.configure do |c|
  # Each of these can be one of the ANSI color code integers or one
  # of [:black, :white, :red, :green, :yellow, :blue, :magenta, :cyan].
  # The values I've assigned here are the defaults so you'll want to change them.

  # Color config is available in RSpec 2.13+. Since this file will
  # always be loaded by RSpec and you may have projects on earlier
  # versions, it's a good idea to only do this on versions that support it.
  if c.respond_to?(:default_color=)
    c.default_color = :white
    c.detail_color  = :yellow
    c.failure_color = :cyan
    c.fixed_color   = :blue
    c.pending_color = :magenta
    c.success_color = :green
  end
end

