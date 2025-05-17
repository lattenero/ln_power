module LnPower
  module RamList

    def self.included(base)

      class << self
        attr_accessor :collection
      end

      def base.collection
        @collection ||= []
      end

      def base.is_ram_list?
         true
      end

      def base.get( obj )
        collection.each do |x|
          return x if x == obj
        end
        nil
      end

      def save
        self.class.collection.push self unless self.class.collection.include? self
      end

      def base.create(args)
        new(args).save
      end

      def base.size
        collection.size
      end

      def base.count
        collection.size
      end

      def base.all
        collection
      end

      def base.first
        collection.first
      end

      def base.last
        collection.last
      end

      def base.find( obj )
        collection.each do |x|
          return x if x == obj
        end
        nil
      end

      def base.destroy_all
        collection = []
      end

      def destroy
        self.class.collection.delete(self)
      end

      def new_record?
        (self.class.collection.include? self) ? false : true
      end
    end
  end
end
