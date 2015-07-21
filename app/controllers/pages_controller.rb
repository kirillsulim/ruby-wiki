class PagesController < ApplicationController
  def add
  end

  def create
    page = Page.new(page_params)
    page.save

    redirect_to action: 'view'
  end

  def edit
    @page = Page.find_by name: params[:path]
  end

  def update
    page = Page.find_by name: params[:path]
    page.update_attributes(page_params)
    page.save

    redirect_to action: 'view'
  end

  def view
    @pages = []
    @path = params[:path]
    if @path
      page = Page.find_by name: @path
      @title = page[:title]
      @content = page[:content]
    else
      @pages = Page.all()
    end
  end

  private
  def page_params
    params.require(:page).permit(:name, :title, :content)
  end
end
