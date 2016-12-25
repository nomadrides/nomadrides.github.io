module RidersHelper
  def featured_riders
    data.riders.select { |_slug, rider| rider.featured }
  end
end
