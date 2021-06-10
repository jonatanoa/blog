class Article < ApplicationRecord
    # Tabla => articles
    # Campos => article.Title() => esto nos va a devolver 'el titulo de el articulo'
    # escribir metodos

    #ESTAS SE HACEN PARA QUE EVITE QUE EL FORMULARIO SE ENVIE VACIO
    # presence: true va a validar que el elemento no este vacio
    # length:{minimum: 20 } minimo 20 caracteres
    # uniqueness: true: para que el titulo no se repita
    validates :title, presence:true, uniqueness: true
    validates :body, presence:true, length:{minimum: 20 }
end
