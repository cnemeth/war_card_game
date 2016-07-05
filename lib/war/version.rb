module CsnWar
  extend self

  def version
    @version ||= begin
      string = '0.0.0'

      def string.parts
        split('.').map { |p| p.to_i }
      end

      def string.major
        parts[0]
      end

      def string.minor
        parts[1]
      end

      def string.patch
        parts[2]
      end

      string
    end
  end
end

