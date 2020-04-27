class PortfoliosController < ApplicationController

	def index
	  @portfolio_items = Portfolio.all 
	end

	def new 
		@portfolio_item = Portfolio.new
	end

	def create
      @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, :main_image))

      respond_to do |format|

        if @portfolio_item.save

          format.html { redirect_to portfolios_path, notice: 'Portfolio se ha creado con exito.' }

        else

          format.html { render :new }

        end
      end
    end

    def update

      @portfolio_item = Portfolio.find(params[:id])

      respond_to do |format|
        if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body, :main_image))
          format.html { redirect_to portfolios_path, notice: 'Portfolio se ha actualizado.' }
        else
          format.html { render :edit }
        end
      end
    end

    def edit
      @portfolio_item = Portfolio.find(params[:id])
    end

    def show
      @portfolio_item = Portfolio.find(params[:id])
    end

    def destroy

      # PErform the lookup
      @portfolio_item = Portfolio.find(params[:id])

      # Destroy/delete element
      @portfolio_item.destroy

      # Redirect to main page
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Se ha eliminado el portafolio' }
      end
    end

end
