class DirectorsController < ApplicationController
  def new
    @director = Director.new
  end

  def index
    @directors = Director.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @directors
      end

      format.html
    end
  end

  def create
    director_attributes = params.require(:director).permit(:name, :dob)
    
    @director = Director.new(director_attributes)

    if @director.valid?
      @director.save
      redirect_to directors_url, notice: "Director created successfully."
    else
      render "new"
    end
  end

end