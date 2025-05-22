# class HomeController < ApplicationController
#   def index
#   end
# end


# class HomeController < ApplicationController
#   def index
#   end

#   def about
#   end
# end

# class HomeController < ApplicationController
#   def index
#     # Store the current visit time
#     session[:last_visit] = Time.now if session[:last_visit].nil?
#     @last_visit = session[:last_visit]
#     # Update the last visit time for the next request
#     session[:last_visit] = Time.now
#   end

#   def about
#     # Store the current visit time
#     session[:last_visit] = Time.now if session[:last_visit].nil?
#     @last_visit = session[:last_visit]
#     # Update the last visit time for the next request
#     session[:last_visit] = Time.now
#   end

#   private

#   # Helper method to format the time difference
#   def time_ago_in_words(from_time)
#     distance_in_seconds = (Time.now - Time.parse(from_time.to_s)).round
#     distance_in_minutes = (distance_in_seconds / 60).round

#     if distance_in_minutes < 60
#       "Last visited: #{distance_in_minutes} minutes ago"
#     else
#       hours = (distance_in_minutes / 60).round
#       "Last visited: #{hours} hours ago"
#     end
#   end
# end



# class HomeController < ApplicationController
#   def index
#     # Track last visit
#     session[:last_visit] = Time.now if session[:last_visit].nil?
#     @last_visit = session[:last_visit]
#     session[:last_visit] = Time.now

#     # Increment visit count for the index page
#     visit = Visit.find_or_create_by(page: 'index')
#     visit.increment!(:count)
#     visit.save

#     # Get visit counts for display
#     @index_visits = Visit.find_by(page: 'index')&.count || 0
#     @about_visits = Visit.find_by(page: 'about')&.count || 0
#     @total_visits = @index_visits + @about_visits
#   end

#   def about
#     # Track last visit
#     session[:last_visit] = Time.now if session[:last_visit].nil?
#     @last_visit = session[:last_visit]
#     session[:last_visit] = Time.now

#     # Increment visit count for the about page
#     visit = Visit.find_or_create_by(page: 'about')
#     visit.increment!(:count)
#     visit.save

#     # Get visit counts for display
#     @index_visits = Visit.find_by(page: 'index')&.count || 0
#     @about_visits = Visit.find_by(page: 'about')&.count || 0
#     @total_visits = @index_visits + @about_visits
#   end

#   private

#   def time_ago_in_words(from_time)
#     distance_in_seconds = (Time.now - Time.parse(from_time.to_s)).round
#     distance_in_minutes = (distance_in_seconds / 60).round

#     if distance_in_minutes < 60
#       "Last visited: #{distance_in_minutes} minutes ago"
#     else
#       hours = (distance_in_minutes / 60).round
#       "Last visited: #{hours} hours ago"
#     end
#   end
# end

# class HomeController < ApplicationController
#   def index
#     session[:last_visit] = Time.now if session[:last_visit].nil?
#     @last_visit = session[:last_visit]
#     session[:last_visit] = Time.now

#     visit = Visit.find_or_create_by(page: 'index')
#     visit.increment!(:count)
#     visit.save

#     @index_visits = Visit.find_by(page: 'index')&.count || 0
#     @about_visits = Visit.find_by(page: 'about')&.count || 0
#     @total_visits = @index_visits + @about_visits

#     @greeting = get_greeting
#   end

#   def about
#     session[:last_visit] = Time.now if session[:last_visit].nil?
#     @last_visit = session[:last_visit]
#     session[:last_visit] = Time.now

#     visit = Visit.find_or_create_by(page: 'about')
#     visit.increment!(:count)
#     visit.save

#     @index_visits = Visit.find_by(page: 'index')&.count || 0
#     @about_visits = Visit.find_by(page: 'about')&.count || 0
#     @total_visits = @index_visits + @about_visits

#     @greeting = get_greeting
#   end

#   private

#   def time_ago_in_words(from_time)
#     distance_in_seconds = (Time.now - Time.parse(from_time.to_s)).round
#     distance_in_minutes = (distance_in_seconds / 60).round

#     if distance_in_minutes < 60
#       "Last visited: #{distance_in_minutes} minutes ago"
#     else
#       hours = (distance_in_minutes / 60).round
#       "Last visited: #{hours} hours ago"
#     end
#   end

#   def get_greeting
#     current_hour = Time.now.hour
#     if current_hour >= 5 && current_hour < 12
#       "Good morning!"
#     elsif current_hour >= 12 && current_hour < 17
#       "Good afternoon!"
#     elsif current_hour >= 17 && current_hour < 21
#       "Good evening!"
#     else
#       "Good night!"
#     end
#   end
# end



class HomeController < ApplicationController
  def index
    session[:last_visit] = Time.now if session[:last_visit].nil?
    @last_visit = session[:last_visit]
    session[:last_visit] = Time.now

    visit = Visit.find_or_create_by(page: 'index')
    visit.increment!(:count)
    visit.save

    @index_visits = Visit.find_by(page: 'index')&.count || 0
    @about_visits = Visit.find_by(page: 'about')&.count || 0
    @total_visits = @index_visits + @about_visits

    @greeting = get_greeting
  end

  def about
    session[:last_visit] = Time.now if session[:last_visit].nil?
    @last_visit = session[:last_visit]
    session[:last_visit] = Time.now

    visit = Visit.find_or_create_by(page: 'about')
    visit.increment!(:count)
    visit.save

    @index_visits = Visit.find_by(page: 'index')&.count || 0
    @about_visits = Visit.find_by(page: 'about')&.count || 0
    @total_visits = @index_visits + @about_visits

    @greeting = get_greeting
  end

  private

  def time_ago_in_words(from_time)
    distance_in_seconds = (Time.now - Time.parse(from_time.to_s)).round
    distance_in_minutes = (distance_in_seconds / 60).round

    if distance_in_minutes < 60
      "Last visited: #{distance_in_minutes} minutes ago"
    else
      hours = (distance_in_minutes / 60).round
      "Last visited: #{hours} hours ago"
    end
  end

  def get_greeting
    current_hour = Time.now.hour
    if current_hour >= 5 && current_hour < 12
      "Good morning!"
    elsif current_hour >= 12 && current_hour < 17
      "Good afternoon!"
    elsif current_hour >= 17 && current_hour < 21
      "Good evening!"
    else
      "Good night!"
    end
  end
end