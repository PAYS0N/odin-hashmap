# frozen_string_literal: true

require_relative("hashmap")

hash = OdinHashmap::Hashmap.new
hash.set("Hi", "There")
hash.set("My", "Friend")
hash.set("erverte", "rand")
hash.set("erverteev", "rand")
hash.set("erverte", "ruby")
hash.display
