require 'json'

class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit,:update,:destroy, :show]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

	def index
	  @portfolio_items = Portfolio.by_position
	end

  def sort
    
    in_hash = JSON.parse(params[:order])
    
    #byebug

    in_hash.each do |key,value|
       
       the_id = value[:id]
       the_pos = value[:position]

       puts "Actualizando Id : #{the_id} Posicion : #{the_pos}"

       Portfolio.find(the_id).update(position,the_pos)

    end

    # Como la ruta a sort es una accion que no necesita view, con lo siguiente 
    # le indicamos a rails que o tiene que buscar una pagina sort en views
    render nothing: true

  end

	def new 
		@portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build}
	end

	def create
      @portfolio_item = Portfolio.new(portfolio_params)

      respond_to do |format|

        if @portfolio_item.save

          format.html { redirect_to portfolios_path, notice: 'Portfolio se ha creado con exito.' }

        else

          format.html { render :new }

        end
      end
    end

    def update

      respond_to do |format|
        if @portfolio_item.update(portfolio_params)
          format.html { redirect_to portfolios_path, notice: 'Portfolio se ha actualizado.' }
        else
          format.html { render :edit }
        end
      end
    end

    def edit
    end

    def show
    end

    def destroy

      # Destroy/delete element
      @portfolio_item.destroy

      # Redirect to main page
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Se ha eliminado el portafolio' }
      end
    end

private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle, 
                                      :body, 
                                      :main_image, 
                                      technologies_attributes: [:name])
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

end
