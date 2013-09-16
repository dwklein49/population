require_relative 'lib/setup'
require_relative 'lib/analytics'

class Population
  attr_accessor :analytics

  def initialize
    areas = Setup.new().areas
    @analytics = Analytics.new(areas)
  end

  def menu
    system 'clear'
    p "Population Menu"
    p "---------------"
    @analytics.options.each do |opt|
      p "#{opt[:menu_id]}. #{opt[:menu_title]}"
    end
  end

  def run
    stop = false
    while stop != :exit do
      #run the menu method
      self.menu
      #grab the choice from the user
      print "Choice: "
      choice = gets.strip.to_i
      #call run on analytics with the choice
      stop = @analytics.run(choice)
      #based on what that returns either
      if stop == :exit
        p "Exiting"
      else 
        #ask user to hit enter (this pauses the loop)
        print "\nHit enter to continue"
        gets
      end
    end
  end
end
p = Population.new
p.run 