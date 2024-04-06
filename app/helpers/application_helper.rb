module ApplicationHelper
  # returns all store names
  def store_names
    @store_names ||= Product.all.pluck(:store_name).uniq
  end

  # returns all store sections names
  def store_section_names
    @store_section_names ||= StoreSection.all.pluck(:name).uniq
  end
end