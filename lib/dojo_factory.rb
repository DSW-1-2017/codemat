module DojoFactory
  class DojoCreator
    def self.create(params, current_user)
      raise "Non implemented Method"
    end
  end

  class KataCreator < DojoCreator
    def self.create(params, current_user)
      current_user.katas.create(params.except(:category))
    end
  end

  class RandoriCreator < DojoCreator
    def self.create(params, current_user)
      current_user.randoris.create(params.except(:category))
    end
  end
end
