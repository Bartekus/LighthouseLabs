module LightBrow
  class History < ActiveRecord::Base

    mattr_accessor :current_history

    def to_s
      "#{url}"
    end
  end
end
