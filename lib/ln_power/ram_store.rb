module LnPower
  class GenID

    def self.gen(long = 24)
      #    dix = ["0","1","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","y","z"]
      dix = ["0","1","3","4","5","6","7","8","9","a","b","c","d","e","f"]
      (0...long).map { dix[rand(dix.size)] }.join
    end

  end
  module RamStore

    def self.included(base)

      base.attr_accessor :_id
      base.instance_eval do
        _id = GenID.gen if _id.nil?
      end

      class << self
        attr_accessor :collection
      end

      def base._hash
        collection
      end

      def base._ids
        collection.keys
      end

      def base.count
        collection.keys.size
      end

      def base.all
        collection.values
      end

      def base.first
        collection[collection.keys.first]
      end

      def base.last
        collection[collection.keys.last]
      end

      def base.find( id )
        case id.class.to_s
        when "String"
          collection[id]
        when "Array"
          id.map{|x| collection[x]}
        else
          nil
        end
      end

      def base.collection
        @collection ||= {}
      end

      def base.create(args)
        new(args).save
      end

      def base.destroy_all
        @collection = {}
      end

      def destroy
        self.class.collection.delete(self._id)
      end

      def new_record?
        (self.class.collection.keys.include? self._id) ? false : true
      end

    end

    def save
      #       self._id = GenID.gen if self._id == nil
      self.class.collection[self._id] = self
    end

  end
end
