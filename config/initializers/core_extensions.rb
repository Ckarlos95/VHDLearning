module CoreExtensions
  module Symbol
    module Procs
      # For calling symbol method whit parameters (to_proc and &:symbol_method)
      def with(*args, &block)
        -> (caller, *rest) { caller.send(self, *rest, *args, &block) }
      end
    end
  end

  module String
    module URL
      def to_url
        self.downcase.tr('àáäâãèéëẽêìíïîĩòóöôõùúüûũñç', 'aaaaaeeeeeiiiiiooooouuuuunc').tr(' ', '-')
      end
    end
  end
end

Symbol.include CoreExtensions::Symbol::Procs
String.include CoreExtensions::String::URL