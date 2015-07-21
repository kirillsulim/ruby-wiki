class PagesController < ApplicationController
  def add
  end

  def create
    page = Page.new(page_params)
    page.save

    redirect_to action: 'view'
  end

  def edit
  end

  def update
    redirect_to action: 'view'
  end

  def view
    @path = params[:path]
    @path = @path.split('/') if @path
    @pages = Page.all
  end

  private
  def page_params
    params.require(:page).permit(:name, :title, :content)
  end
end
