class PagesController < ApplicationController
  def add
    if !@page
      @page = Page.new
    end
  end

  def create
    @page = Page.new(page_params)
    @page.save

    if @page.valid?
      redirect_to action: 'view'
    else
      render 'add'
    end
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
    @path = params[:path]
    if @path
      page = Page.find_by name: @path
      @title = page[:title]
      @content = page[:content]
      @pages = []
    else
      @pages = Page.all()
    end
  end

  private
  def page_params
    params.require(:page).permit(:name, :title, :content)
  end
end
