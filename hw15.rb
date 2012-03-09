
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    
    class_eval <<-READER, __FILE__, __LINE__ + 1
      attr_reader :#{attr_name}_history, :#{attr_name}
    
      def #{attr_name}=(val)
        if !@#{attr_name}_history
          @#{attr_name}_history = [nil]
        end
        @#{attr_name}_history.push val
        @#{attr_name}=val
      end
    READER
  end
end


