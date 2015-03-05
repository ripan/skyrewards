module CommonHelper
  def random_name
    [*('A'..'Z')].sample(8).join
  end
  def random_number
    "#{(Time.now.to_f * 1000).to_i}"
  end
end