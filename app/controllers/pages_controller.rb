class PagesController < ApplicationController
  def add
  end

  def create
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
end
