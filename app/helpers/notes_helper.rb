module NotesHelper
  def days_ago date
    diff = (Time.now.to_date - date.to_date).to_i
    return 'Today' if diff == 0
    "#{diff} days ago" 
  end
end
