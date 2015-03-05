module SkyrewardsExtention
  class AccountNUmber
    def self.get
      "#{(Time.now.to_f * 1000).to_i}"
    end
  end
end
