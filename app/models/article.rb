class Article < ActiveRecord::Base
    # Tabla => articles
    # Campos => article.Title() => esto nos va a devolver 'el titulo de el articulo'
    # escribir metodos

    #ESTAS SE HACEN PARA QUE EVITE QUE EL FORMULARIO SE ENVIE VACIO
    # presence: true va a validar que el elemento no este vacio
    # length:{minimum: 20 } minimo 20 caracteres
    # uniqueness: true: para que el titulo no se repita
    belongs_to :user
    validates :title, presence:true, uniqueness: true
    validates :body, presence:true, length:{minimum: 20 }
    before_save :set_visits_count

    def update_visits_count
        self.update(visits_count: self.visits_count + 1)
    end
    private
    def set_visits_count
        self.visits_count ||= 0       
    end
end
