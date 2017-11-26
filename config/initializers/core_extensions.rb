module CoreExtensions
  module Symbol
    module ToProc
      # For calling symbol method whit parameters (to_proc and &:symbol_method)
      def with(*args, &block)
        -> (caller, *rest) { caller.send(self, *rest, *args, &block) }
      end
    end
  end
end

Symbol.include CoreExtensions::Symbol::ToProc