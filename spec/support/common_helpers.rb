module CommonHelpers
  def random_name
    [*('A'..'Z')].sample(8).join
  end
end