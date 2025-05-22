# class HomeController < ApplicationController
#   def index
#   end
# end


class HomeController < ApplicationController
  def index
    track_last_visit
    track_visit_counts
    set_greeting
  end

  private

  # 1) Last-visit time
  def track_last_visit
    if cookies[:last_visit_time]
      last = Time.at(cookies[:last_visit_time].to_i)
      # distance_of_time_in_words needs view helper:
      @last_visit_display = "Last visited: " +
        view_context.distance_of_time_in_words(last, Time.current) + " ago"
    else
      @last_visit_display = "Welcome! This is your first visit."
    end
    cookies[:last_visit_time] = Time.current.to_i
  end

  # 2) Visit counters
  def track_visit_counts
    # total visits across all pages (we’ll key by :total_visits)
    cookies[:total_visits] = cookies[:total_visits].to_i + 1
    @total_count = cookies[:total_visits]

    # page-specific visits (key by path)
    key = "visits_#{request.path}"
    cookies[key] = cookies[key].to_i + 1
    @page_count = cookies[key]
  end

  # 3) Time-based greeting
  def set_greeting
    hour = Time.current.hour
    @greeting =
      case hour
      when 5..11    then "Good morning!"
      when 12..16   then "Good afternoon!"
      when 17..20   then "Good evening!"
      else               "Good night!"
      end
  end
end
