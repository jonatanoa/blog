class ArticlesController < ApplicationController
	
	before_action :authenticate_user!, except: [:show, :index] #en vez de except, puede ser only que seria lo contrario
	before_action :set_article, except: [:index, :new, :create]
	#a esta ruta se accede con GET /articles
	def index #este es de leer
		#todos los registros. SELECT *FROM articles
		@articles = Article.all #nos permite traer todo los registros que hay en la tabla articles
	end
	# get articles/:id
	def show #este es de vista
		#ecuentra un registro por su id
		# @article = Article.find(params[:id])#le podemos pasar el id de la tabla y va a buscar ese elemento
		#where
		#Article.where("title LIKE?", "%hola%") #busca cuantos registros tienen la palabra hola
		#Article.where("id = ?", params[:id]) # para buscar por la id
		#Article.where.not("id = ?", params[:id]) # para mostrar las id que el usuario no paso como parametro
				#EJEMPLO: Article.where.not("id = 1")... se le puede acregar el count
		@article.update_visits_count
	end

	#get articles/new
	def new #esto va a buscar una accion new en el contador articles, esto nos va a permitir crear un  nuevo articulo
		@article = Article.new
	end

	def edit
	end
	#POST /articles
	def create
		@article = current_user.articles.new(title:params[:article][:title], #aqui se pasa como clave, el campo de la base de dato que queremos guardar 
								body: params[:article][:body])
		if @article.save
            redirect_to @article
        else
            render :new
        end 
	end

	#DELETE /articles/:id
	def destroy 
		#DELETE FROM articles
		
		@article.destroy #destroy elimina ek objeto de la base de datos
		redirect_to articles_path# recireccione a la pagina donde se encuengtra todos los archivos
	end

	#PUT /articles/:id
	def update
		#UPDATE
		# @articles.update_attributes({title: "nuevo titulo"}) //va a actualizar el registro con la base de datos
		@article = curren_user.articles.new(article_params)
		if @article.save
			redirect_to @article
		else 								# sino, redirije de nuevo a edit
			render :new
		end
	end
	private
	 def set_article
	 	@article = Article.find(params[:id]) #busca el articulo que quiere eliminar el usuario
	 end

	 def article_params
	 	params.require(:article).permit(:title,:body)
	 end

end