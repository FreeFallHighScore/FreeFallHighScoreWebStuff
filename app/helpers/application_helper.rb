module ApplicationHelper
  def rank_in_words rank
    case rank
    when 1
      "Leader"
    when 2
      "Second"
    when 3
      "Third"
    end
  end

  def query_to_string
    params.map{|k,v| "#{k}:#{v}" }.join(":")
  end
end
