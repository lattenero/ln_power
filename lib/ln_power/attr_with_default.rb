module LnPower
  module AttrWithDefault
    def attr_accessor_with_default(nome, valore_default)
      attr_accessor nome
      define_method(nome) do
        instance_variable_get("@#{nome}") || instance_variable_set("@#{nome}", valore_default)
      end
    end
    # class MiaClasse
    #  extend LnPower::AttrWithDefault
    #  attr_accessor_with_default :mia_variabile, "valore predefinito"
    # end
  end
end
